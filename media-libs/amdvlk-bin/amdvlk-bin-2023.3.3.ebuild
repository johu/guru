# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

MULTILIB_COMPAT=( abi_x86_{32,64} )

inherit rpm unpacker multilib-build

DESCRIPTION="AMD Open Source Driver for Vulkan: official binary version"
HOMEPAGE="https://github.com/GPUOpen-Drivers/AMDVLK"
MY_PV="${PV/'.'/'.Q'}"
FETCH_URI="https://github.com/GPUOpen-Drivers/AMDVLK/releases/download"
SRC_URI="${FETCH_URI}/v-${MY_PV}/amdvlk-${MY_PV}.x86_64.rpm -> ${P}-amd64.rpm
	${FETCH_URI}/v-${MY_PV}/amdvlk_${MY_PV}_i386.deb -> ${P}-i386.deb"

S="${WORKDIR}"

LICENSE="MIT"
SLOT="legacy-polaris"
KEYWORDS="-* ~amd64" # The hardware is not supported pure x86 anymore

REQUIRED_USE="abi_x86_64"
RESTRICT="test"

RDEPEND="
	sys-libs/zlib[${MULTILIB_USEDEP}]
	app-arch/zstd[${MULTILIB_USEDEP}]
	x11-libs/libdrm[${MULTILIB_USEDEP}]
	x11-libs/libXrandr[${MULTILIB_USEDEP}]
	x11-libs/libxcb[${MULTILIB_USEDEP}]
	x11-libs/libxshmfence[${MULTILIB_USEDEP}]
	>=media-libs/vulkan-loader-1.3.268[${MULTILIB_USEDEP}]
	!media-libs/amdvlk
	!media-libs/amdvlk-bin:0
	!media-libs/amdvlk-bin:legacy-si
	"
DEPEND="${RDEPEND}"
BDEPEND="sys-apps/sed"
QA_PREBUILT="*"

pkg_pretend(){
	elog "This is last version which supports AMD's legacy graphics cards such as:"
	elog "Radeon™ RX Vega Series"
	elog "Radeon™ RX 400/500 Series"
	elog "Radeon™ Pro WX 9100, x200 Series"
	elog "Radeon™ Pro W5700/W5500 Series"
	elog "Use it at your own risk"
	elog "Check Gentoo Wiki for further information"
	elog "https://wiki.gentoo.org/wiki/AMDVLK"
	if use abi_x86_32; then
		ewarn "32-bit amdvlk binary is untested"
		ewarn "Work in progress, use it at your risk"
	fi
}

src_unpack(){
	einfo "Unpacking abi_x86_64..."
	mkdir -p "${S}"/amd64
	cd "${S}"/amd64 || die
	rpm_unpack ${P}-amd64.rpm
	if use abi_x86_32; then
		einfo "Unpacking abi_x86_32..."
		mkdir -p "${S}"/i386 || die
		cd "${S}"/i386 || die
		unpacker ${P}-i386.deb
	fi
}

src_prepare() {
	default
	if use abi_x86_32; then
		einfo "Changing layout of abi_x86_32 from debian/ubuntu to Gentoo/RHEL-alike"
		mv "${S}/i386/usr/lib/i386-linux-gnu/amdvlk32.so" "${S}/i386/usr/lib/" || die
		rm -d "${S}/i386/usr/lib/i386-linux-gnu/" || die
		rm -r "${S}/i386/usr/share/" || die
	fi
	mv "${S}/amd64/usr/share/doc/amdvlk/LICENSE.txt" "${S}" || die
	rm -r "${S}/amd64/usr/share/" || die
}

src_configure(){
	if use abi_x86_32; then
		einfo "Changing configuration of abi_x86_32 from debian/ubuntu to Gentoo/RHEL-alike"
		sed -i 's/\/usr\/lib\/i386-linux-gnu\/amdvlk32.so/\/usr\/lib\/amdvlk32.so/g' \
		"${S}/i386/etc/vulkan/icd.d/amd_icd32.json" || die
		sed -i 's/\/usr\/lib\/i386-linux-gnu\/amdvlk32.so/\/usr\/lib\/amdvlk32.so/g' \
		"${S}/i386/etc/vulkan/implicit_layer.d/amd_icd32.json" || die
	fi
}
src_compile(){
	einfo "Nothing to compile..."
}

src_install(){
	if use abi_x86_32; then
		cp -a "${S}/i386"/* "${D}" || die
	fi
	cp -a "${S}/amd64"/* "${D}" || die
	dodoc LICENSE.txt
}

pkg_postinst(){
	ewarn "If you are using Xorg:"
	ewarn "Make sure the following line is NOT included in the any Xorg configuration section:"
	ewarn "| Driver	  \"modesetting\""
	ewarn "and make sure you use DRI3 mode for Xorg"
	ewarn "If you are using Wayland, it should be fine"
	elog "More information about the configuration can be found here:"
	elog "https://github.com/GPUOpen-Drivers/AMDVLK"
	elog "${GENTOO_WIKI_PAGE}#Configuration_and_features"
	elog "You can use AMD_VULKAN_ICD variable to switch to the required driver."
	elog "AMD_VULKAN_ICD=RADV application   - for using radv."
	elog "AMD_VULKAN_ICD=AMDVLK application - for using amdvlk."
}
