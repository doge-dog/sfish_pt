# This script was automatically generated from the dsa-640
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(16176);
 script_version("$Revision: 1.9 $");
 script_xref(name: "DSA", value: "640");
 script_cve_id("CVE-2005-0016");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-640 security update');
 script_set_attribute(attribute: 'description', value:
'Erik Sj�lund discovered a buffer overflow in xatitv, one of the
programs in the gatos package, that is used to display video with
certain ATI video cards.  xatitv is installed setuid root in order to
gain direct access to the video hardware.
For the stable distribution (woody) this problem has been fixed in
version 0.0.5-6woody3.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2005/dsa-640');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your gatos package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA640] DSA-640-1 gatos");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-640-1 gatos");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'gatos', release: '3.0', reference: '0.0.5-6woody3');
deb_check(prefix: 'libgatos-dev', release: '3.0', reference: '0.0.5-6woody3');
deb_check(prefix: 'libgatos0', release: '3.0', reference: '0.0.5-6woody3');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
