package Jobeet::Schema::Result::Job;
use v5.22.1;
use strict;
use warnings;
use parent 'Jobeet::Schema::ResultBase';
use Jobeet::Schema::Types;
use Jobeet::Models;
use Digest::SHA1 qw/sha1_hex/;
use Data::UUID;

__PACKAGE__->table('jobeet_job');

__PACKAGE__->add_columns(
    
    id => PK_INTEGER,
    category_id => PK_INTEGER,
    type => VARCHAR(
        is_nullable => 1,
    ),
    position => VARCHAR,
    location => VARCHAR,
    description => TEXT,
    how_to_apply => TEXT,
    token => VARCHAR,
    is_public => TINYINT (
        default_value => 1,
    ),
    is_activated => TINYINT,
    email => VARCHAR,
    expires_at => DATETIME,
    created_at => DATETIME,
    updated_at => DATETIME,
    company => TEXT (
        is_nullable => 1,
    ),
    logo => TEXT (
        is_nullable => 1,
    ),
    url => TEXT (
        is_nullable => 1,
    ),
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint(['token']);

__PACKAGE__->belongs_to( category => 'Jobeet::Schema::Result::Category', 'category_id' );

sub insert {
    my $self = shift;
    my $conf = models('conf')->{active_days};
    $self->expires_at( models('Schema')->now->add( days => $conf ) );
    $self->token( sha1_hex(Data::UUID->new->create) );

    # $self->expires_at( models('Schema')->now->add( days => models('conf')->{active_days} ) );
    $self->next::method(@_);
}


sub is_expired {
    my ($self) = @_;
    $self->days_before_expired < 0;
}


sub days_before_expired {
    my ($self) = @_;
    ($self->expires_at - models('Schema')->now)->days;
}


sub expires_soon {
    my ($self) = @_;
    $self->days_before_expired < 5;
}


sub publish {
    my ($self) = @_;
    $self->update({ is_activated => 1 });
}

1;