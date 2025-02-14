# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER="1.71.1"

inherit cargo desktop git-r3 xdg-utils

DESCRIPTION="Tool for rendering OSDs over Walksnail DVR recordings"
HOMEPAGE="https://github.com/avsaase/walksnail-osd-tool"
EGIT_REPO_URI="https://github.com/avsaase/walksnail-osd-tool.git"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 GPL-3 ISC UbuntuFontLicense-1.0 MIT MPL-2.0 OFL-1.1 Unicode-DFS-2016 Unlicense XC ZLIB"
SLOT="0"

DEPEND="
	dev-libs/openssl:=
	x11-libs/gtk+:3
"
RDEPEND="
	${DEPEND}
	media-video/ffmpeg
"

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
	cargo_src_configure --frozen
}

src_install() {
	cargo_src_install --path ./ui

	cp resources/icons/app-icon.svg walksnail-osd-tool.svg || die
	doicon -s scalable walksnail-osd-tool.svg
	make_desktop_entry walksnail-osd-tool 'Walksnail OSD Tool' walksnail-osd-tool
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
