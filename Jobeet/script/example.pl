#!/usr/bin/env perl

# example.pl
use v5.22.1;
use strict;
use warnings;
use lib 'lib';
use feature qw(say);

use Jobeet::Models;
my $json_string1 = '{"hoge": "fuga"}';
my $json_string2 = '{"foo": "bar"}';

my $data = models('Schema::Something')->create({
    json_column1 => $json_string1,
    json_column2 => $json_string2,
});

say $data->json_column1->{hoge}; # fuga

my $json  = { hoge => 'fuga'};
my $json2 = { foo  => 'bar' };

my $data2 = models('Schema::Something')->create({
    json_column1 => $json,
    json_column2 => $json2,
});

say $data2->json_column2->{foo}; # bar