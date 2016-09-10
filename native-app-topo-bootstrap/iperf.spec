 
%define _sbindir /usr/sbin
Name: iperf 
Version: 2.0.9
Release: XR_6.1.1
License: Copyright (c) 2015 Cisco Systems Inc. All rights reserved.
Packager: cisco
SOURCE0 : %{name}-%{version}-source.tar.gz
Group: 3rd party application
Summary: iperf compiled for WRL7: XR 6.1.1

%description
This is a compiled version of iperf-2.0.9 for WRL7: XR 6.1.1

%prep

%setup -q -n %{name}-%{version}

%build
./configure
make

%install
rm -rf %{buildroot}
mkdir -p %{buildroot}%{_sbindir}
install -m755 src/iperf %{buildroot}%{_sbindir}

%files

%defattr(-,root,root)

%{_sbindir}/iperf

%clean

