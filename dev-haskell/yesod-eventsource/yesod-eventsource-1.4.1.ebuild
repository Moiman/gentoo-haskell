# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Server-sent events support for Yesod apps"
HOMEPAGE="http://www.yesodweb.com/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/blaze-builder:=[profile?]
	>=dev-haskell/conduit-0.5:=[profile?] <dev-haskell/conduit-1.3:=[profile?]
	>=dev-haskell/wai-1.3:=[profile?]
	>=dev-haskell/wai-eventsource-1.3:=[profile?]
	dev-haskell/wai-extra:=[profile?]
	>=dev-haskell/yesod-core-1.4:=[profile?] <dev-haskell/yesod-core-1.5:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
"
