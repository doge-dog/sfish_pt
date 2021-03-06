
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if (NASL_LEVEL < 3000 ) exit(0);

if(description)
{
 script_id(27112);
 script_version ("$Revision: 1.6 $");
 script_name(english: "SuSE Security Update:  MozillaFirefox 1.5.0.4 security update. (MozillaFirefox-1585)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch MozillaFirefox-1585");
 script_set_attribute(attribute: "description", value: "This updates fixes several security problems in the Mozilla 
Firefox 1.5 browser and brings it up to 1.5.0.4 bugfix 
level.  The full list is at: 
http://www.mozilla.org/projects/security/known-vulnerabiliti
es.html#firefox1.5.0.4  MFSA 2006-31/CVE-2006-2787: 
EvalInSandbox allows remote attackers to gain privileges 
via javascript that calls the valueOf method on objects 
that were created outside of the sandbox.  MFSA 
2006-32/CVE-2006-2780: An Integer overflow allows remote 
attackers to cause a denial of service (crash) and possibly 
execute arbitrary code via 'jsstr tagify,' which leads to 
memory corruption.  MFSA 2006-32/CVE-2006-2779: Firefox 
allow remote attackers to cause a denial of service (crash) 
and possibly execute arbitrary code via (1) nested <option> 
tags in a select tag, (2) a DOMNodeRemoved mutation event, 
(3) 'Content-implemented tree views,' (4) BoxObjects, (5) 
the XBL implementation, (6) an iframe that attempts to 
remove itself, which leads to memory corruption.  MFSA 
2006-33/CVE-2006-2786: HTTP response smuggling 
vulnerability in Mozilla Firefox, when used with certain 
proxy servers, allows remote attackers to cause Firefox to 
interpret certain responses as if they were responses from 
two different sites via (1) invalid HTTP response headers 
with spaces between the header name and the colon, which 
might not be ignored in some cases, or (2) HTTP 1.1 headers 
through an HTTP 1.0 proxy, which are ignored by the proxy 
but processed by the client.  MFSA 2006-34/CVE-2006-2785: 
Cross-site scripting (XSS) vulnerability in Mozilla Firefox 
allows user-complicit remote attackers to inject arbitrary 
web script or HTML by tricking a user into (1) performing a 
'View Image' on a broken image in which the SRC attribute 
contains a Javascript URL, or (2) selecting 'Show only this 
frame' on a frame whose SRC attribute contains a Javascript 
URL.  MFSA 2006-35/CVE-2006-2775: Mozilla Firefox 
associates XUL attributes with the wrong URL under certain 
unspecified circumstances, which might allow remote 
attackers to bypass restrictions by causing a persisted 
string to be associated with the wrong URL.  MFSA 
2006-36/CVE-2006-2784: The PLUGINSPAGE functionality in 
Mozilla Firefox allows remote user-complicit attackers to 
execute privileged code by tricking a user into installing 
missing plugins and selecting the 'Manual Install' button, 
then using nested javascript: URLs.  MFSA 
2006-37/CVE-2006-2776: Certain privileged UI code in 
Mozilla Firefox calls content-defined setters on an object 
prototype, which allows remote attackers to execute code at 
a higher privilege than intended.  MFSA 
2006-38/CVE-2006-2778: The crypto.signText function in 
Mozilla Firefox allows remote attackers to execute 
arbitrary code via certain optional Certificate Authority 
name arguments, which causes an invalid array index and 
triggers a buffer overflow.  MFSA 2006-39/CVE-2006-1942: 
Mozilla Firefox allows user-complicit remote attackers to 
open local files via a web page with an IMG element 
containing a SRC attribute with a non-image file:// URL, 
then tricking the user into selecting View Image for the 
broken image, as demonstrated using a ,wma file to launch 
Windows Media Player, or by referencing an 'alternate web 
page.'  MFSA-2006-41/CVE-2006-2782: Firefox does not fix 
all test cases associated with CVE-2006-1729, which allows 
remote attackers to read arbitrary files by inserting the 
target filename into a text box, then turning that box into 
a file upload control.  MFSA 2006-42/CVE-2006-2783: Mozilla 
Firefox strips the Unicode Byte-order-Mark (BOM) from a 
UTF-8 page before the page is passed to the parser, which 
allows remote attackers to conduct cross-site scripting 
(XSS) attacks via a BOM sequence in the middle of a 
dangerous tag such as SCRIPT.   MFSA 2006-43/CVE-2006-2777: 
Unspecified vulnerability in Mozilla Firefox allows remote 
attackers to execute arbitrary code by using the 
nsISelectionPrivate interface of the Selection object to 
add a SelectionListener and create notifications that are 
executed in a privileged context.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Install the security patch MozillaFirefox-1585");
script_end_attributes();

script_cve_id("CVE-2006-2787", "CVE-2006-2780", "CVE-2006-2779", "CVE-2006-2786", "CVE-2006-2785", "CVE-2006-2775", "CVE-2006-2784", "CVE-2006-2776", "CVE-2006-2778", "CVE-2006-1942", "CVE-2006-2782", "CVE-2006-1729", "CVE-2006-2783", "CVE-2006-2777");
script_summary(english: "Check for the MozillaFirefox-1585 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"MozillaFirefox-1.5.0.4-1.3", release:"SUSE10.1") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"MozillaFirefox-translations-1.5.0.4-1.3", release:"SUSE10.1") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
exit(0,"Host is not affected");
