use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('File::Find::Rule::RPMSpec', 'File::Find::Rule::RPMSpec is covered.');
