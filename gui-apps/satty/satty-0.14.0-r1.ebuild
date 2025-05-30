# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.22.0
	adler@1.0.2
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.15
	anstyle-parse@0.2.5
	anstyle-query@1.1.1
	anstyle-wincon@3.0.4
	anstyle@1.0.8
	anyhow@1.0.86
	arrayvec@0.7.4
	autocfg@1.3.0
	backtrace@0.3.73
	bitflags@1.3.2
	bitflags@2.6.0
	bumpalo@3.16.0
	bytemuck@1.16.1
	byteorder@1.5.0
	bytes@1.6.1
	cairo-rs@0.19.4
	cairo-sys-rs@0.19.2
	cc@1.1.6
	cfg-expr@0.15.8
	cfg-if@1.0.0
	chrono@0.4.38
	clap@4.5.11
	clap_builder@4.5.11
	clap_complete@4.5.11
	clap_complete_fig@4.5.2
	clap_complete_nushell@4.5.3
	clap_derive@4.5.11
	clap_lex@0.7.2
	color_quant@1.1.0
	colorchoice@1.0.2
	core-foundation-sys@0.8.6
	crc32fast@1.4.2
	cstr@0.2.12
	dlib@0.5.2
	epoxy@0.1.0
	equivalent@1.0.1
	femtovg@0.8.2
	field-offset@0.3.6
	flate2@1.0.30
	flume@0.11.0
	fnv@1.0.7
	fontconfig@0.8.0
	fragile@2.0.0
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	gdk-pixbuf-sys@0.19.8
	gdk-pixbuf@0.19.8
	gdk4-sys@0.8.2
	gdk4@0.8.2
	generational-arena@0.2.9
	getrandom@0.2.15
	gimli@0.29.0
	gio-sys@0.19.8
	gio@0.19.8
	gl_generator@0.9.0
	glib-macros@0.19.9
	glib-sys@0.19.8
	glib@0.19.9
	glow@0.13.1
	gobject-sys@0.19.8
	graphene-rs@0.19.8
	graphene-sys@0.19.8
	gsk4-sys@0.8.2
	gsk4@0.8.2
	gtk4-macros@0.8.2
	gtk4-sys@0.8.2
	gtk4@0.8.2
	gvdb@0.5.3
	hashbrown@0.14.5
	heck@0.5.0
	hermit-abi@0.3.9
	hex_color@3.0.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.60
	image@0.24.9
	imgref@1.10.1
	indexmap@2.2.6
	is_terminal_polyfill@1.70.1
	itoa@1.0.11
	js-sys@0.3.69
	khronos_api@2.2.0
	lazy_static@1.5.0
	libadwaita-sys@0.6.0
	libadwaita@0.6.0
	libc@0.2.155
	libloading@0.8.5
	lock_api@0.4.12
	log@0.4.22
	lru@0.12.3
	memchr@2.7.4
	memoffset@0.9.1
	miniz_oxide@0.7.4
	mio@1.0.1
	nanorand@0.7.0
	num-traits@0.2.19
	object@0.36.2
	once_cell@1.19.0
	pango-sys@0.19.8
	pango@0.19.8
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	pin-project-lite@0.2.14
	pin-utils@0.1.0
	pkg-config@0.3.30
	ppv-lite86@0.2.17
	proc-macro-crate@1.3.1
	proc-macro-crate@3.1.0
	proc-macro2@1.0.86
	quick-xml@0.31.0
	quote@1.0.36
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_syscall@0.5.3
	relm4-icons@0.8.3
	relm4-macros@0.8.1
	relm4@0.8.1
	resource@0.5.0
	rgb@0.8.45
	rustc-demangle@0.1.24
	rustc_version@0.4.0
	rustybuzz@0.11.0
	ryu@1.0.18
	safe-transmute@0.11.3
	same-file@1.0.6
	scopeguard@1.2.0
	semver@1.0.23
	serde@1.0.204
	serde_derive@1.0.204
	serde_json@1.0.120
	serde_spanned@0.6.7
	shared_library@0.1.9
	signal-hook-registry@1.4.2
	slab@0.4.9
	slotmap@1.0.7
	smallvec@1.13.2
	socket2@0.5.7
	spin@0.9.8
	static_assertions@1.1.0
	strsim@0.11.1
	syn@1.0.109
	syn@2.0.72
	system-deps@6.2.2
	target-lexicon@0.12.15
	thiserror-impl@1.0.63
	thiserror@1.0.63
	tokio-macros@2.4.0
	tokio@1.39.2
	toml@0.8.16
	toml_datetime@0.6.7
	toml_edit@0.19.15
	toml_edit@0.21.1
	toml_edit@0.22.17
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing@0.1.40
	ttf-parser@0.20.0
	unicode-bidi-mirroring@0.1.0
	unicode-bidi@0.3.15
	unicode-ccc@0.1.2
	unicode-ident@1.0.12
	unicode-properties@0.1.1
	unicode-script@0.5.6
	unicode-segmentation@1.11.0
	utf8parse@0.2.2
	version-compare@0.2.0
	version_check@0.9.5
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-shared@0.2.92
	wasm-bindgen@0.2.92
	web-sys@0.3.69
	winapi-util@0.1.8
	windows-core@0.52.0
	windows-sys@0.52.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	winnow@0.5.40
	winnow@0.6.16
	xdg@2.5.2
	xml-rs@0.7.0
	yeslogic-fontconfig-sys@5.0.0
	zvariant@3.15.2
	zvariant_derive@3.15.2
	zvariant_utils@1.0.1
"

inherit cargo desktop xdg

DESCRIPTION="A screenshot annotation tool inspired by Swappy and Flameshot."
HOMEPAGE="https://github.com/gabm/satty"

if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/gabm/Satty.git"
else
	SRC_URI="
		https://github.com/gabm/Satty/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		${CARGO_CRATE_URIS}
	"
	M_PN=Satty
	S="${WORKDIR}/${M_PN}-${PV}"
	KEYWORDS="~amd64"
fi

LICENSE="MPL-2.0"
SLOT="0"

RDEPEND="
	dev-libs/glib:2
	media-libs/fontconfig
	media-libs/libepoxy
	media-libs/mesa[opengl]
	media-libs/graphene
	gui-libs/libadwaita
	gui-libs/gtk:4
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/pango
"

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_unpack() {
	if [[ "${PV}" == 9999 ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_install() {
	dodoc README.md

	dobin "$(cargo_target_dir)"/satty
	#Just add the icon and desktop file
	doicon "${S}/assets/satty.svg"
	domenu "${S}/satty.desktop"
}
