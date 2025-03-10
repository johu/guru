# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.4

EAPI=8

CRATES="
	addr2line@0.24.2
	adler2@2.0.0
	adler32@1.2.0
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.21
	amdgpu-sysfs@0.17.5
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.7
	anstyle@1.0.10
	anyhow@1.0.95
	ash@0.37.3+1.3.251
	async-broadcast@0.7.2
	async-recursion@1.1.1
	async-trait@0.1.85
	autocfg@1.4.0
	backtrace@0.3.74
	bindgen@0.68.1
	bitflags@1.3.2
	bitflags@2.8.0
	bumpalo@3.16.0
	bytemuck@1.21.0
	bytemuck_derive@1.8.1
	bytes@1.9.0
	cairo-rs@0.20.7
	cairo-sys-rs@0.20.7
	cc@1.2.10
	cexpr@0.6.0
	cfg-expr@0.17.2
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	chrono@0.4.39
	clang-sys@1.8.1
	clap@4.5.27
	clap_builder@4.5.27
	clap_derive@4.5.24
	clap_lex@0.7.4
	colorchoice@1.0.3
	concurrent-queue@2.5.0
	condtype@1.3.0
	console@0.15.10
	core-foundation-sys@0.8.7
	core-foundation@0.9.4
	core-graphics-types@0.1.3
	core2@0.4.0
	crc32fast@1.4.2
	crossbeam-queue@0.3.12
	crossbeam-utils@0.8.21
	crunchy@0.2.3
	ctrlc@3.4.5
	darling@0.20.10
	darling_core@0.20.10
	darling_macro@0.20.10
	dary_heap@0.3.7
	deranged@0.3.11
	diff@0.1.13
	divan-macros@0.1.17
	divan@0.1.17
	either@1.13.0
	encode_unicode@1.0.0
	endi@1.1.0
	enum_dispatch@0.3.13
	enumflags2@0.7.11
	enumflags2_derive@0.7.11
	equivalent@1.0.1
	errno@0.3.10
	event-listener-strategy@0.5.3
	event-listener@5.4.0
	fastrand@2.3.0
	field-offset@0.3.6
	filetime@0.2.25
	flume@0.11.1
	fnv@1.0.7
	fragile@2.0.0
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-executor@0.3.31
	futures-io@0.3.31
	futures-macro@0.3.31
	futures-sink@0.3.31
	futures-task@0.3.31
	futures-util@0.3.31
	futures@0.3.31
	gdk-pixbuf-sys@0.20.7
	gdk-pixbuf@0.20.7
	gdk4-sys@0.9.5
	gdk4@0.9.5
	getrandom@0.2.15
	gimli@0.31.1
	gio-sys@0.20.8
	gio@0.20.7
	glib-macros@0.20.7
	glib-sys@0.20.7
	glib@0.20.7
	glob@0.3.2
	gobject-sys@0.20.7
	graphene-rs@0.20.7
	graphene-sys@0.20.7
	gsk4-sys@0.9.5
	gsk4@0.9.5
	gtk4-macros@0.9.5
	gtk4-sys@0.9.5
	gtk4@0.9.5
	half@2.4.1
	hashbrown@0.14.5
	hashbrown@0.15.2
	heck@0.4.1
	heck@0.5.0
	hex@0.4.3
	home@0.5.11
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.61
	ident_case@1.0.1
	indexmap@2.7.1
	inotify-sys@0.1.5
	inotify@0.11.0
	insta@1.42.0
	is_terminal_polyfill@1.70.1
	itertools@0.13.0
	itoa@1.0.14
	js-sys@0.3.77
	kqueue-sys@1.0.4
	kqueue@1.0.8
	lazy_static@1.5.0
	lazycell@1.3.0
	libadwaita-sys@0.7.1
	libadwaita@0.7.1
	libc@0.2.169
	libdrm_amdgpu_sys@0.8.2
	libflate@2.1.0
	libflate_lz77@2.1.0
	libloading@0.7.4
	libloading@0.8.6
	libredox@0.1.3
	linked-hash-map@0.5.6
	linux-raw-sys@0.4.15
	lock_api@0.4.12
	log@0.4.25
	malloc_buf@0.0.6
	matchers@0.1.0
	memchr@2.7.4
	memoffset@0.9.1
	minimal-lexical@0.2.1
	miniz_oxide@0.8.3
	mio@1.0.3
	nanorand@0.7.0
	nix@0.29.0
	nom@7.1.3
	notify-types@2.0.0
	notify@8.0.0
	nu-ansi-term@0.46.0
	num-conv@0.1.0
	num-traits@0.2.19
	num_threads@0.1.7
	objc@0.2.7
	object@0.36.7
	once_cell@1.20.2
	ordered-stream@0.2.0
	os-release@0.1.0
	overload@0.1.1
	pango-sys@0.20.7
	pango@0.20.7
	parking@2.2.1
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	pciid-parser@0.8.0
	peeking_take_while@0.1.2
	pin-project-lite@0.2.16
	pin-utils@0.1.0
	pkg-config@0.3.31
	plotters-backend@0.3.7
	plotters-cairo@0.7.0
	plotters@0.3.7
	powerfmt@0.2.0
	pretty_assertions@1.4.1
	prettyplease@0.2.29
	proc-macro-crate@3.2.0
	proc-macro2@1.0.93
	quote@1.0.38
	raw-window-handle@0.5.2
	redox_syscall@0.5.8
	regex-automata@0.1.10
	regex-automata@0.4.9
	regex-lite@0.1.6
	regex-syntax@0.6.29
	regex-syntax@0.8.5
	regex@1.11.1
	relm4-components@0.9.1
	relm4-css@0.9.0
	relm4-macros@0.9.1
	relm4@0.9.1
	rle-decode-fast@1.0.3
	rustc-demangle@0.1.24
	rustc-hash@1.1.0
	rustc_version@0.4.1
	rustix@0.38.44
	rustversion@1.0.19
	ryu@1.0.18
	same-file@1.0.6
	scopeguard@1.2.0
	semver@1.0.25
	serde-error@0.1.2
	serde@1.0.217
	serde_derive@1.0.217
	serde_json@1.0.137
	serde_repr@0.1.19
	serde_spanned@0.6.8
	serde_with@3.12.0
	serde_with_macros@3.12.0
	serde_yaml@0.9.34+deprecated
	sharded-slab@0.1.7
	shlex@1.3.0
	signal-hook-registry@1.4.2
	similar@2.7.0
	simple_logger@5.0.0
	slab@0.4.9
	smallvec@1.13.2
	socket2@0.5.8
	spin@0.9.8
	static_assertions@1.1.0
	strsim@0.11.1
	syn@2.0.96
	system-deps@7.0.3
	tar@0.4.43
	target-lexicon@0.12.16
	tempfile@3.15.0
	termcolor@1.4.1
	terminal_size@0.4.1
	thiserror-impl@1.0.69
	thiserror@1.0.69
	thread-priority@1.2.0
	thread_local@1.1.8
	time-core@0.1.2
	time-macros@0.2.19
	time@0.3.37
	tokio-macros@2.5.0
	tokio@1.43.0
	toml@0.8.19
	toml_datetime@0.6.8
	toml_edit@0.22.22
	tracing-attributes@0.1.28
	tracing-core@0.1.33
	tracing-log@0.2.0
	tracing-subscriber@0.3.19
	tracing@0.1.41
	tracker-macros@0.2.2
	tracker@0.2.2
	uds_windows@1.1.0
	unicode-ident@1.0.15
	unsafe-libyaml@0.2.11
	utf8parse@0.2.2
	valuable@0.1.1
	vergen@8.3.2
	version-compare@0.2.0
	version_check@0.9.5
	vk-parse@0.12.0
	vulkano@0.34.1
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.100
	wasm-bindgen-macro-support@0.2.100
	wasm-bindgen-macro@0.2.100
	wasm-bindgen-shared@0.2.100
	wasm-bindgen@0.2.100
	web-sys@0.3.77
	which@4.4.2
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
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
	winnow@0.6.24
	wrapcenum-derive@0.4.1
	xattr@1.4.0
	xdg-home@1.3.0
	xml-rs@0.8.25
	yansi@1.0.1
	zbus@5.3.1
	zbus_macros@5.3.1
	zbus_names@4.1.1
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
	zvariant@5.2.0
	zvariant_derive@5.2.0
	zvariant_utils@3.1.0
"

declare -A GIT_CRATES=(
	[copes]='https://gitlab.com/corectrl/copes;1bc002a030345787f0e11e0317975a2e4f2a22ee'
	[nvml-wrapper-sys]='https://github.com/ilya-zlobintsev/nvml-wrapper;890581189516191428a8b8c7ba3b006adf03a3fc;nvml-wrapper-%commit%/nvml-wrapper-sys'
	[nvml-wrapper]='https://github.com/ilya-zlobintsev/nvml-wrapper;890581189516191428a8b8c7ba3b006adf03a3fc;nvml-wrapper-%commit%/nvml-wrapper'
)

LLVM_COMPAT=( {18..19} )
RUST_MIN_VER="1.76.0"

inherit cargo llvm-r2 xdg

DESCRIPTION="Linux GPU Control Application"
HOMEPAGE="https://github.com/ilya-zlobintsev/LACT"
SRC_URI="
	https://github.com/ilya-zlobintsev/LACT/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/${P^^}"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD CC0-1.0 GPL-3 ISC MIT
	Unicode-3.0 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gui libadwaita test"
REQUIRED_USE="libadwaita? ( gui ) test? ( gui )"
RESTRICT="!test? ( test )"

DEPEND="
	x11-libs/libdrm[video_cards_amdgpu]
	gui? (
		dev-libs/glib:2
		gui-libs/gtk:4[introspection]
		media-libs/fontconfig
		media-libs/freetype
		media-libs/graphene
		x11-libs/cairo
		x11-libs/pango
	)
	libadwaita? ( >=gui-libs/libadwaita-1.4.0:1 )
"
RDEPEND="
	${DEPEND}
	sys-apps/hwdata
"
# libclang is required for bindgen
BDEPEND="
	dev-util/blueprint-compiler
	virtual/pkgconfig
	$(llvm_gen_dep 'llvm-core/clang:${LLVM_SLOT}')
"

QA_FLAGS_IGNORED="usr/bin/lact"

pkg_setup() {
	llvm-r2_pkg_setup
	rust_pkg_setup
}

src_configure() {
	sed -i "/^strip =/d" Cargo.toml || die
	sed -i "s|target/release|$(cargo_target_dir)|" Makefile || die

	local myfeatures=(
		$(usev gui lact-gui)
		$(usev libadwaita adw)
	)
	cargo_src_configure --no-default-features -p lact
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	newinitd res/lact-daemon-openrc lactd
}
