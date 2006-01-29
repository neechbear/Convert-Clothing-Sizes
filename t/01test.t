use lib qw(./lib ../lib);
use Test::More qw(no_plan);
use Convert::Clothing::Sizes;

chdir 't' if -d 't';

ok(my $ccs = new Convert::Clothing::Sizes, 'Create new Convert::Clothing::Sizes object');

