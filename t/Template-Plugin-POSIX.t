use strict;
use Test::More tests => 3;
use Template::Plugin::POSIX;

#########################

use Template;
use File::Compare 'compare_text';

my $dir = '.';
$dir = 't' if -d 't';
my $ttfile = "$dir/test.tt";
my $outfile = "$dir/out";

my $tt = Template->new;
ok($tt->process($ttfile, {}, $outfile));
ok(-f $outfile);
is(compare_text($outfile,"$outfile~"), 0);
