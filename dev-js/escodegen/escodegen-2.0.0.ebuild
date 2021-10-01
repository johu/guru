# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit node

DESCRIPTION="ECMAScript code generator"
HOMEPAGE="
	https://github.com/estools/escodegen
	https://www.npmjs.com/package/escodegen
"

LICENSE="BSD-2"
KEYWORDS="~amd64"
RDEPEND="
	${NODEJS_RDEPEND}
	dev-js/estraverse
	dev-js/esutils
	dev-js/esprima
	dev-js/optionator
	dev-js/source-map
"
