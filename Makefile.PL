# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Output bioperl subroutines for Error::Pure.';
author 'Michal Špaček <skim@cpan.org>';
license 'bsd';
name 'Error-Pure-Output-Bio';
requires 'Error::Pure::Utils' => 0.11;
requires 'Exporter' => 0;
requires 'Readonly' => 0;
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=Error-Pure-Output-Bio';
resources 'homepage' => 'https://github.com/tupinek/Error-Pure-Output-Bio';
resources 'repository' => 'git://github.com/tupinek/Error-Pure-Output-Bio';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.05;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
