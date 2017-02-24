use strict;
use warnings;
use utf8;
use lib 'lib';

use Jobeet::Models;
use DBIx::Class::Optional::Dependencies;
use Path::Class;

my $sql_file = models('home') . '/sql/schema.sql';
my $file     = Path::Class::file($sql_file);

my $output = models('Schema')->deployment_statements(
    undef, undef, undef, {
        no_comments    => 1,
        add_drop_table => 0,
    }
);

$file->parent->mkpath;
$file->spew( iomode => '>:encoding(UTF-8)', $output );