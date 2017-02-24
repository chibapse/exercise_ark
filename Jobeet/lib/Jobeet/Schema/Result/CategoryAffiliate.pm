package Jobeet::Schema::Result::CategoryAffiliate;
use v5.22.1;
use strict;
use warnings;
use parent 'Jobeet::Schema::ResultBase';
use Jobeet::Schema::Types;

__PACKAGE__->table('jobeet_category_affiliate');

__PACKAGE__->add_columns(
    category_id => PK_INTEGER,
    affiliate_id => PK_INTEGER,
);

__PACKAGE__->set_primary_key(qw/category_id affiliate_id/);

__PACKAGE__->belongs_to( category => 'Jobeet::Schema::Result::Category', 'category_id' );
__PACKAGE__->belongs_to( affiliate => 'Jobeet::Schema::Result::Affiliate', 'affiliate_id' );

1;