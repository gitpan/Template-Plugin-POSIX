use strict;
use inc::Module::Install;

name            ('Template-Plugin-POSIX');
all_from        ('lib/Template/Plugin/POSIX.pm');

requires        ('POSIX'    => '1.09');
requires        ('Template' => '2.14');
requires        ('Data::Dumper');

build_requires  ('Test::Base' => '0.53');

auto_install;
WriteAll;

