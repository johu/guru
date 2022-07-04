# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit R-packages edo

DESCRIPTION="Various Programming Utilities"
KEYWORDS="~amd64"
LICENSE='LGPL-2.1+'
CRAN_PN="R.utils"
IUSE="test"
RESTRICT="!test? ( test )"

SRC_URI="mirror://cran/src/contrib/${CRAN_PN}_${PV}.tar.gz"

DEPEND="
	>=dev-R/R_oo-1.24.0
	>=dev-R/R_methodsS3-1.8.1
	test? ( >=dev-R/digest-0.6.10 )
"

SUGGESTED_PACKAGES="
	>=dev-R/digest-0.6.10
"

src_test() {
	cd "${WORKDIR}/${P}/tests" || die
	for i in *.R; do
		R_LIBS="${T}/R" edo Rscript --vanilla $i
	done
}
