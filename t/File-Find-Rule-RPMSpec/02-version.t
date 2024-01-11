use strict;
use warnings;

use File::Find::Rule::RPMSpec;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($File::Find::Rule::RPMSpec::VERSION, 0.01, 'Version.');
