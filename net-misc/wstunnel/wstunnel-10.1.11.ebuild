# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
"

inherit cargo

DESCRIPTION="Tunnel all your traffic over Websocket or HTTP2 - Bypass firewalls/DPI"
HOMEPAGE="https://github.com/erebe/wstunnel/"
SRC_URI="https://github.com/erebe/wstunnel/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://raw.githubusercontent.com/PPN-SD/vendor/refs/tags/${P}/${P}-crates.tar.xz"

LICENSE="BSD"
# Autogenerated by pycargoebuild
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD CC0-1.0 ISC MIT MPL-2.0 openssl Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"

QA_FLAGS_IGNORED="usr/bin/wstunnel"

src_compile() {
	cargo_src_compile --package wstunnel-cli
}

src_test() {
	# skip test with network sandbox violations
	cargo_src_test -- \
		--skip test_proxy_connection
}

src_install() {
	cargo_src_install --path wstunnel-cli
	local DOCS+=( README.md docs/*.md )
	einstalldocs
}
