Name: efind-gdkpixbuf
Version: 0.2.1
Release:        1%{?dist}
Summary: Filter search results by image properties.

License: GPLv3+
URL: https://github.com/20centaurifux/efind-gdkpixbuf
Source0: efind-gdkpixbuf-0.2.1.tar.xz

BuildRequires: gdk-pixbuf2-devel
Requires: gdk-pixbuf2, efind

%description
efind-pixbuf is an extension for efind. It makes it possible
to filter search results by image properties.

%global debug_package %{nil}

%prep
%setup -q


%build
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT
%make_install


%files
%{_libdir}/efind/extensions/*.so



%changelog
