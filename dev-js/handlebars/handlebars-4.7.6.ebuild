# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit node

DESCRIPTION="Handlebars provides the power necessary to let you build semantic templates effectively with no frustration"
HOMEPAGE="
	http://www.handlebarsjs.com/
	https://www.npmjs.com/package/handlebars
"

LICENSE="MIT"
KEYWORDS="~amd64"
RDEPEND="
	${NODEJS_RDEPEND}
	dev-js/minimist
	dev-js/neo-async
	dev-js/source-map
	dev-js/wordwrap
	dev-js/uglify-js
"
