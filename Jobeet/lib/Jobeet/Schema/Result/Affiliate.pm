package Jobeet::Schema::Result::Affiliate;
use v5.22.1;
use strict;
use warnings;
use parent 'Jobeet::Schema::ResultBase';
use Jobeet::Schema::Types;

use Digest::SHA1 qw/sha1_hex/;
use Data::UUID;

__PACKAGE__->table('jobeet_affiliate');

__PACKAGE__->add_columns(
    id => PK_INTEGER,
    url => VARCHAR,
    email => VARCHAR,
    token => VARCHAR(
        size => 80,
    ),
    is_active => TINYINT,
    created_at => DATETIME,
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint(['email']);

__PACKAGE__->has_many( category_affiliate => 'Jobeet::Schema::Result::CategoryAffiliate', 'affiliate_id' );
__PACKAGE__->many_to_many( categories => category_affiliate => 'category' );


sub insert {
    my $self = shift;

    $self->token(sha1_hex(Data::UUID->new->create))
        unless $self->token;

    $self->next::method(@_);
}

1;