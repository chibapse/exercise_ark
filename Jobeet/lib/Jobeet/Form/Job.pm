package Jobeet::Form::Job;
use Ark 'Form';

use Jobeet::Models;

param category => (
    label   => x('Category'),
    type    => 'ChoiceField',
    choices => [map { $_->slug => $_->name } models('Schema::Category')->all],
    constraints => [
        'NOT_NULL',
    ],
);

param type => (
    label   => x('Type'),
    type    => 'ChoiceField',
    choices => [
        'full-time' => 'Full time',
        'part-time' => 'Part time',
        'freelance' => 'Freelance',
    ],
    constraints => [
        'NOT_NULL',
    ],
);

param company => (
    label       => c('Company'),
    type        => 'TextField',
    constraints => [
        'NOT_NULL',
    ],
);

param url => (
    label => c('URL'),
    type  => 'URLField',
);

param position => (
    label       => c('position'),
    type        => 'TextField',
    constraints => [
        'NOT_NULL',
    ],
);

param location => (
    label       => c('Location'),
    type        => 'TextField',
    constraints => [
        'NOT_NULL',
    ],
);

param description => (
    label       => c('Description'),
    type        => 'TextField',
    widget      => 'textarea',
    attr        => {
        cols => 30,
        rows => 4,
    },
    constraints => [
        'NOT_NULL',
    ],
);

param how_to_apply => (
    label       => c('How to apply?'),
    type        => 'TextField',
    widget      => 'textarea',
    attr        => {
        cols => 30,
        rows => 4,
    },
    constraints => [
        'NOT_NULL',
    ],
);

param email => (
    label       => c('Email'),
    type        => 'TextField',
    constraints => [
        'NOT_NULL',
        'EMAIL_LOOSE',
    ],
);

sub messages {
    return {
        not_null => x('please input [_1]'),
        int      => x('please input [_1] as integer'),
        ascii    => x('please input [_1] as ascii characters without space'),
    };
}

1;