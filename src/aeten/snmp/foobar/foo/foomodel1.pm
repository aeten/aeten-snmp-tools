package aeten::snmp::foobar::foo::foomodel1;
use strict;
use aeten::snmp::foobar::foo;

sub update($) {
	my ($self, $agent, $index) = @_;
	printf "Update Foo Model 1 from $agent\n";
	printf "Foo index OID = $fooIndex.$index.0\n";
	printf "Foo type OID  = $fooType.$index.0\n";
	printf "Foo name OID  = $fooName.$index.0\n";
	printf "Foo state OID = $fooState.$index.0\n";
}
return 1;
