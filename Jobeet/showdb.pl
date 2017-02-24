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
my $category_rs = $schema->resultset('Category');
print $category_rs->count . "\n";

# データを入れる
my $category = $category_rs->create({
    name => 'new category',
});
print $category_rs->count . "\n";


# 全体から条件にマッチするResultSetを返す
my $new_rs = $category_rs->search({ name => 'new category' });

# 5個ずつ取得した場合の１ページ目
$new_rs = $category_rs->search({ }, { rows => 5, page => 1 });

# IDから検索
$category = $category_rs->find('id');