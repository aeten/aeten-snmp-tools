#!/usr/bin/env perl
use strict;
use aeten::snmp::foobar::foo qw(%fooimpl);
use aeten::snmp::foobar::bar qw(%barimpl);

my $agent_name = "aeten foobar agent";
my $index = 1;
foreach my $hw (keys %fooimpl) {
	my $impl=$fooimpl{$hw};
	$impl->update($agent_name, $index++);
}
$index = 1;
foreach my $hw (keys %barimpl) {
	my $impl=$barimpl{$hw};
	$impl->update($agent_name, $index++);
}
