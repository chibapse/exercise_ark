use v5.22.1;
use strict;
use warnings;
use utf8;
use lib 'lib';

use Jobeet::Schema;

# my $schema = Jobeet::Schema->connect(
#     'dbi:mysql:database_name',
#     'username',
#     'password',
# );

my $schema = Jobeet::Schema->connect('dbi:SQLite:./test.db');

$schema->deploy;

my $category_rs = $schema->resultset('Category');
print $category_rs->count;

