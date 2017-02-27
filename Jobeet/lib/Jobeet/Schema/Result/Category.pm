package Jobeet::Schema::Result::Category;
use v5.22.1;
use strict;
use warnings;
use parent 'Jobeet::Schema::ResultBase';
use Jobeet::Schema::Types;
use Jobeet::Models;
use String::CamelCase qw(decamelize);

__PACKAGE__->table('jobeet_category');

__PACKAGE__->add_columns(
    id => PK_INTEGER,
    name => VARCHAR,
    slug => VARCHAR(
        is_nullable => 1,
    )
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint(['name']);
__PACKAGE__->add_unique_constraint(['slug']);

__PACKAGE__->has_many( jobs => 'Jobeet::Schema::Result::Job', 'category_id' );
__PACKAGE__->has_many( category_affiliate => 'Jobeet::Schema::Result::CategoryAffiliate', 'category_id', 
    {
        is_foreign_key_constraint   => 0,
        cascade_delete              => 0,      
    }
);
__PACKAGE__->many_to_many( affiliates => category_affiliate => 'affiliate' );

sub get_active_jobs {
    my $self = shift;
    my $attr = shift || {};

    $self -> jobs(
        { expires_at    => { '>=', models('Schema')->now->strftime("%F %T") } },
        {   order_by    => { -desc => 'created_at' },
            defined $attr->{rows} ? (rows => $attr->{rows}) : (),
            defined $attr->{page} ? (page => $attr->{page}) : (),
        }
    );
}

sub insert {
    my $self = shift;

    $self->slug( decamelize $self->name );
    $self->next::method(@_);
}

sub update {
    my $self = shift;

    if ($self->is_column_changed('name')) {
        $self->slug( decamelize $self->name);
    }

    $self->next::method(@_);
}

1;