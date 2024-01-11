use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Common rules for searching RPM spec files.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.08;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'File-Find-Rule-RPMSpec';
readme_from 'RPMSpec.pm';
recursive_author_tests('xt');
requires 'Error::Pure' => 0;
requires 'File::Find::Rule' => 0;
requires 'Parse::RPM::Spec' => 0;
requires 'perl' => '5.6.2';
resources 'bugtracker' => 'https://github.com/michal-josef-spacek/File-Find-Rule-RPMSpec/issues';
resources 'homepage' => 'https://github.com/michal-josef-spacek/File-Find-Rule-RPMSpec';
resources 'repository' => 'git://github.com/michal-josef-spacek/File-Find-Rule-RPMSpec';
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
