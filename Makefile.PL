use strict;
#use warnings;
#use Config;
use inc::Module::Install;

name            ('Template-Plugin-POSIX');
version_from    ('lib/Template/Plugin/POSIX.pm');
abstract       ( 'Perl Template Toolkit Plugin to Import POSIX Functions' );
author          ('Agent Zhang <agent2002@126.com>');
license         ('perl');

requires        ('Template');
requires        ('Data::Dumper');
build_requires  ('Test::More');
build_requires  ('File::Compare');

&WriteAll;
