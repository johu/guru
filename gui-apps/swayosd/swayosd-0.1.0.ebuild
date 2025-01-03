# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.4

EAPI=8

CRATES="
	anyhow@1.0.86
	async-broadcast@0.7.1
	async-channel@1.9.0
	async-channel@2.3.1
	async-executor@1.13.0
	async-fs@2.1.2
	async-global-executor@2.4.1
	async-io@1.13.0
	async-io@2.3.4
	async-lock@2.8.0
	async-lock@3.4.0
	async-process@2.2.4
	async-recursion@1.1.1
	async-signal@0.2.10
	async-std@1.12.0
	async-task@4.7.1
	async-trait@0.1.81
	atk-sys@0.17.0
	atk@0.17.1
	atomic-waker@1.1.2
	autocfg@1.3.0
	bitflags@1.3.2
	bitflags@2.6.0
	blight@0.7.1
	block-buffer@0.10.4
	blocking@1.6.1
	bumpalo@3.16.0
	byteorder@1.5.0
	cairo-rs@0.17.10
	cairo-sys-rs@0.17.10
	cascade@1.0.1
	cc@1.1.15
	cfg-expr@0.15.8
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	colored@2.1.0
	concurrent-queue@2.5.0
	cpufeatures@0.2.13
	crossbeam-utils@0.8.20
	crypto-common@0.1.6
	digest@0.10.7
	either@1.13.0
	endi@1.1.0
	enumflags2@0.7.10
	enumflags2_derive@0.7.10
	equivalent@1.0.1
	errno@0.3.9
	evdev-rs@0.6.1
	evdev-sys@0.2.5
	event-listener-strategy@0.5.2
	event-listener@2.5.3
	event-listener@5.3.1
	fastrand@1.9.0
	fastrand@2.1.1
	field-offset@0.3.6
	fs4@0.6.6
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-lite@1.13.0
	futures-lite@2.3.0
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	gdk-pixbuf-sys@0.17.10
	gdk-pixbuf@0.17.10
	gdk-sys@0.17.0
	gdk@0.17.1
	generic-array@0.14.7
	getrandom@0.2.15
	gio-sys@0.17.10
	gio@0.17.10
	glib-macros@0.17.10
	glib-sys@0.17.10
	glib@0.17.10
	gloo-timers@0.2.6
	gobject-sys@0.17.10
	gtk-layer-shell-sys@0.6.0
	gtk-layer-shell@0.6.1
	gtk-sys@0.17.0
	gtk3-macros@0.17.1
	gtk@0.17.1
	hashbrown@0.14.5
	heck@0.4.1
	heck@0.5.0
	hermit-abi@0.3.9
	hermit-abi@0.4.0
	hex@0.4.3
	indexmap@2.5.0
	input-sys@1.18.0
	input@0.8.3
	instant@0.1.13
	io-lifetimes@1.0.11
	itertools@0.8.2
	js-sys@0.3.70
	kv-log-macro@1.0.7
	lazy_static@1.5.0
	libc@0.2.158
	libpulse-binding@2.28.1
	libpulse-sys@1.21.0
	libudev-sys@0.1.4
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.14
	log@0.4.22
	memchr@2.7.4
	memoffset@0.7.1
	memoffset@0.9.1
	nix@0.26.4
	nix@0.29.0
	num-derive@0.3.3
	num-traits@0.2.19
	once_cell@1.19.0
	ordered-stream@0.2.0
	pango-sys@0.17.10
	pango@0.17.10
	parking@2.2.0
	pin-project-lite@0.2.14
	pin-utils@0.1.0
	piper@0.2.4
	pkg-config@0.3.30
	polling@2.8.0
	polling@3.7.3
	ppv-lite86@0.2.20
	proc-macro-crate@1.3.1
	proc-macro-crate@3.2.0
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.86
	pulsectl-rs@0.3.2
	quote@1.0.37
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rustc_version@0.4.1
	rustix@0.37.27
	rustix@0.38.35
	semver@1.0.23
	serde@1.0.209
	serde_derive@1.0.209
	serde_repr@0.1.19
	serde_spanned@0.6.7
	sha1@0.10.6
	shlex@1.3.0
	shrinkwraprs@0.3.0
	signal-hook-registry@1.4.2
	slab@0.4.9
	smallvec@1.13.2
	socket2@0.4.10
	static_assertions@1.1.0
	substring@1.4.5
	syn@1.0.109
	syn@2.0.77
	system-deps@6.2.2
	target-lexicon@0.12.16
	tempfile@3.12.0
	thiserror-impl@1.0.63
	thiserror@1.0.63
	toml@0.8.19
	toml_datetime@0.6.8
	toml_edit@0.19.15
	toml_edit@0.22.20
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing@0.1.40
	typenum@1.17.0
	udev@0.7.0
	uds_windows@1.1.0
	unicode-ident@1.0.12
	value-bag@1.9.0
	version-compare@0.2.0
	version_check@0.9.5
	waker-fn@1.2.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.93
	wasm-bindgen-futures@0.4.43
	wasm-bindgen-macro-support@0.2.93
	wasm-bindgen-macro@0.2.93
	wasm-bindgen-shared@0.2.93
	wasm-bindgen@0.2.93
	web-sys@0.3.70
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winnow@0.5.40
	winnow@0.6.18
	xdg-home@1.3.0
	zbus@4.4.0
	zbus_macros@4.4.0
	zbus_names@3.0.0
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
	zvariant@4.2.0
	zvariant_derive@4.2.0
	zvariant_utils@2.1.0
"

inherit cargo meson

MY_PN="SwayOSD"
DESCRIPTION="GTK based on screen display for keyboard shortcuts like caps-lock and volume"
HOMEPAGE="https://github.com/ErikReider/SwayOSD"
SRC_URI="
	https://github.com/ErikReider/SwayOSD/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="GPL-3"
# Dependent crate licenses
LICENSE+="
	Apache-2.0-with-LLVM-exceptions BSD GPL-3+ MIT MPL-2.0
	Unicode-DFS-2016
"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-libs/glib:2
	dev-libs/libevdev
	dev-libs/libinput:=
	gui-libs/gtk-layer-shell
	media-libs/libpulse
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/pango
"
DEPEND="${RDEPEND}"
BDEPEND="
	app-alternatives/ninja
	dev-lang/sassc
"

# Rust
QA_FLAGS_IGNORED="usr/bin/${PN}-client usr/bin/${PN}-libinput-backend usr/bin/${PN}-server"

src_unpack() {
	default
	cargo_src_unpack
	sed -i -e '/^subdir('\''src'\'')$/d' "${S}"/meson.build || die
}

src_configure() {
	cargo_src_configure
	meson_src_configure
}

src_compile() {
	cargo_src_compile
	meson_src_compile
}

src_install() {
	meson_src_install
	cargo_src_install
}
