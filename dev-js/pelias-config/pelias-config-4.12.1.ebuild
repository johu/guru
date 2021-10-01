# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit node

DESCRIPTION="Configuration settings for Pelias"
HOMEPAGE="
	https://github.com/pelias/config
	https://www.npmjs.com/package/pelias-config
"

LICENSE="MIT"
KEYWORDS="~amd64"
RDEPEND="
	${NODEJS_RDEPEND}
	dev-js/hapi+joi
	dev-js/lodash
"
