use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('CtrlNest');
$t->get_ok('/')->status_is(302);

done_testing();
