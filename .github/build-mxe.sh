sudo apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    autopoint \
    bash \
    bison \
    bzip2 \
    flex \
    g++ \
    g++-multilib \
    gettext \
    git \
    gperf \
    intltool \
    libc6-dev-i386 \
    libgdk-pixbuf2.0-dev \
    libltdl-dev \
    libgl-dev \
    libssl-dev \
    libtool-bin \
    libxml-parser-perl \
    lzip \
    make \
    openssl \
    p7zip-full \
    patch \
    perl \
    python3 \
    python3-mako \
    python3-pkg-resources \
    ruby \
    sed \
    unzip \
    wget \
    xz-utils
    
git clone --depth 1 https://github.com/mxe/mxe.git 
ln -s /usr/bin/python3 /usr/bin/python
#make -C mxe  MXE_TARGETS=x86_64-w64-mingw32.static.posix \
#   MXE_PLUGIN_DIRS=plugins/examples/qt5-freeze \
#   ccache
  
   
make -C mxe  MXE_TARGETS=x86_64-w64-mingw32.static.posix \
   MXE_PLUGIN_DIRS=plugins/examples/qt5-freeze \
   gcc glib libzip libusb1 libftdi1 hidapi glibmm qtbase qtimageformats \
   qtsvg qttranslations boost check gendef libieee1284 \
   qtbase_CONFIGURE_OPTS='-no-sql-mysql'   

rm -fr mxe/pkg
rm -fr mxe/.ccache
rm -fr mxe/log*/
rm -fr mxe/pkg
rm -fr mxe/tmp-*
rm -fr mxe/.ccache  
tar cJf mxe.tar.xz mxe