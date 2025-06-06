# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="An intersection of the Registry and Factory pattern"
HOMEPAGE="https://github.com/todofixthis/class-registry"
SRC_URI="https://github.com/todofixthis/class-registry/archive/${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/class-registry-${PV}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

distutils_enable_tests unittest

python_test() {
	"${EPYTHON}" -m unittest || die "Tests failed with ${EPYTHON}"
}
