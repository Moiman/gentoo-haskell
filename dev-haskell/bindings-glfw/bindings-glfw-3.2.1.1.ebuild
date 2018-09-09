# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.6.9999
#hackport: flags: -macosxusechdir,-macosxuseretina,-macosxusemenubar,-mir,x:X,-wayland

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

MY_PN="bindings-GLFW"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Low-level bindings to GLFW OpenGL library"
HOMEPAGE="http://hackage.haskell.org/package/bindings-GLFW"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+X exposenative wayland"

RESTRICT=test # fails

RDEPEND=">=dev-haskell/bindings-dsl-1.0:=[profile?] <dev-haskell/bindings-dsl-1.1:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	>=media-libs/glfw-3.2
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( >=dev-haskell/hunit-1.3 <dev-haskell/hunit-1.7
		>=dev-haskell/test-framework-0.8 <dev-haskell/test-framework-0.9
		>=dev-haskell/test-framework-hunit-0.3 <dev-haskell/test-framework-hunit-0.4 )
	virtual/pkgconfig
"

S="${WORKDIR}/${MY_P}"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag exposenative exposenative) \
		--flag=-macosxusechdir \
		--flag=-macosxusemenubar \
		--flag=-macosxuseretina \
		--flag=-mir \
		--flag=system-glfw \
		$(cabal_flag wayland wayland) \
		$(cabal_flag X x)
}