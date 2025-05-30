# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_MPV="rdepend"
MPV_REQ_USE="lua"
PYTHON_COMPAT=( python3_{11..14} )
inherit mpv-plugin python-single-r1

COMMIT="6743bd47d4cfce3ae3d5dd4f587f3193bd4fb9b2"
DESCRIPTION="mpv script to skip sponsored segments of YouTube videos"
HOMEPAGE="https://github.com/po5/mpv_sponsorblock"
SRC_URI="https://github.com/po5/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-3"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
"

MPV_PLUGIN_FILES=(
	sponsorblock_shared
	sponsorblock.lua
)

src_prepare() {
	default

	# we 1) install in the system folder 2) use EPYTHON
	sed -i sponsorblock.lua \
		-e 's|scripts_dir =.*|scripts_dir = "/etc/mpv/scripts"|' \
		-e "s|python3|${EPYTHON}|" || die
}

pkg_postinst() {
	# will make use of the correct user folders
	# ref: https://github.com/po5/mpv_sponsorblock/pull/17
	ewarn "This version of the plugin is not meant to be installed for"
	ewarn 'the whole system. It is advised to add "local_database = no"'
	ewarn "in script-opts/sponsorblock.conf to avoid trying to write"
	ewarn "inside root-owned directories."
}
