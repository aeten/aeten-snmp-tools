#!/usr/bin/env perl
use strict;
use aeten::snmp::foobar::foo qw(%foo);
use aeten::snmp::foobar::bar qw(%bar);

my $agent_name = "aeten foobar agent";
my $index = 1;
foreach my $hw (keys %foo) {
	my $impl=$foo{$hw};
	$impl->update($agent_name, $index++);
}
$index = 1;
foreach my $hw (keys %bar) {
	my $impl=$bar{$hw};
	$impl->update($agent_name, $index++);
}
