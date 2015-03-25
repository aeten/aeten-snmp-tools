package aeten::modules;
use strict;

# Imports a subpackage list
# Params: package subpackage [subpackage2 [...]]
# Returns an installed packages map like:
#   <subpackage>: <package>
#   <subpackage2>: <package2>
#   [...]
sub import_lazy($@) {
	my $package= shift;
	my %installed_package;
	foreach my $subpackage (@_) {
		my $module = $package.'::'.$subpackage;
		eval "require $module; 1";
		$installed_package{$subpackage} = $module unless ($@);
	}
	return %installed_package;
}

return 1;
