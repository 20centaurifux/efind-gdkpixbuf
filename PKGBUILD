# Maintainer: Sebastian Fedrau <sebastian.fedrau@gmail.com>
pkgname=efind-gdkpixbuf
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Filter search results by image properties."
arch=('i686' 'x86_64')
url="https://github.com/20centaurifux/efind-gdkpixbuf"
license=('GPL3')
groups=()
depends=('efind>=0.1.0' 'gdk-pixbuf2>=2.30.0-1')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.xz")
noextract=()
md5sums=('5d67db39c6fded6b3783f1984710b77c')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
