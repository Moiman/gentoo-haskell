# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

CABAL_FEATURES="lib profile haddock"
inherit base versionator eutils haskell-cabal

MY_PV_YEAR=$(get_version_component_range 1)
MY_PV_MONTH=$(get_version_component_range 2)
(( ${MY_PV_MONTH} < 10 )) && MY_PV_MONTH="0${MY_PV_MONTH}"
MY_PV_DAY=$(get_version_component_range 3)
(( ${MY_PV_DAY} < 10 )) && MY_PV_DAY="0${MY_PV_DAY}"
MY_PV="${MY_PV_YEAR}${MY_PV_MONTH}${MY_PV_DAY}"

DESCRIPTION="Haskell HTTP Package"
HOMEPAGE="http://www.haskell.org/http/"
SRC_URI="http://www.haskell.org/http/download/${PN}-${MY_PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/ghc-6.4"

S="${WORKDIR}/${PN}-${MY_PV}"

src_unpack() {
	base_src_unpack

	# switch from -O2 to -O
	sed -i -e "s/GHC-options: -O2/GHC-options: -O/" "${S}/http.cabal"
	echo "Other-Modules: Network.HTTP.Base64," >> "${S}/http.cabal"
	echo "               Network.HTTP.MD5,"    >> "${S}/http.cabal"
	echo "               Network.HTTP.MD5Aux"  >> "${S}/http.cabal"
}

src_install() {
	cabal_src_install

	dodoc README LICENSE
}
