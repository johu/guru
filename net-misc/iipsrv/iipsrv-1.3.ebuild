# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="High performance image server for high resolution and scientific images"
HOMEPAGE="https://iipimage.sourceforge.io"
SRC_URI="https://downloads.sourceforge.net/iipimage/IIP%20Server/${P}/${P}.tar.bz2"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

IUSE="png webp avif jpeg2k memcached lighttpd apache2"

DEPEND="
	dev-libs/fcgi
	media-libs/libjpeg-turbo
	media-libs/tiff
	memcached? ( dev-libs/libmemcached-awesome )
	png? ( media-libs/libpng )
	webp? ( media-libs/libwebp )
	avif? ( media-libs/libavif )
	jpeg2k? ( media-libs/openjpeg )
	apache2? ( www-servers/apache[apache2_modules_proxy,apache2_modules_proxy_fcgi] )
	lighttpd? ( www-servers/lighttpd )"

RDEPEND="
	acct-user/iipsrv
	acct-group/iipsrv
	${DEPEND}"

BDEPEND="${DEPEND}"

src_configure() {
	econf \
		$(use_enable memcached libmemcached) \
		$(use_enable jpeg2k openjpeg) \
		$(use_enable png) \
		$(use_enable webp) \
		$(use_enable avif)
}

src_install() {

	emake DESTDIR="${D}" install

	# Install systemd service
	systemd_newunit "${FILESDIR}"/${PN}.systemd.service iipsrv.service
	# Install systemd environment file
	insinto /etc/default/
	newins "${FILESDIR}"/${PN}.systemd.conf iipsrv

	# Install OpenRC script and config
	newinitd scripts/openrc/iipsrv.initd iipsrv
	newconfd "${FILESDIR}"/iipsrv.confd iipsrv

	# Install Lighttpd configuration
	if use lighttpd ; then
		elog "Installing Lighttpd configuration ..."
		elog "Add line 'include \"iipsrv.conf\"' to /etc/lighttpd/lighttpd.conf and (re)start Lighttpd"
		insinto /etc/lighttpd/
		newins "${FILESDIR}"/iipsrv.lighttpd.conf iipsrv.conf
	fi

	# Install Apache configuration
	if use apache2 ; then
		elog "Installing Apache configuration ..."
		elog "Define PROXY in /etc/conf.d/apache2 and (re)start Apache"
		insinto /etc/apache2/modules.d/
		newins "${FILESDIR}"/iipsrv.apache2.conf 20_iipsrv.conf
	fi

}
