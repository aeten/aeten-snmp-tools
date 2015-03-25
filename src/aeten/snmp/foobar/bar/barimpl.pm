package aeten::snmp::foobar::bar::barimpl;
use strict;
use aeten::snmp::foobar::bar;

sub update($) {
	my ($self, $agent, $index) = @_;
	printf "Update Bar from $agent\n";
	printf "Bar index OID      = $barIndex.$index.0\n";
	printf "Bar type OID       = $barType.$index.0\n";
	printf "Bar name OID       = $barName.$index.0\n";
	printf "Bar connection OID = $barConnection.$index.0\n";
}
return 1;
