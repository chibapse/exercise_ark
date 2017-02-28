#!/usr/bin/env perl

use strict;
use warnings;
use FindBin::libs;

use Jobeet::Models;
use DateTime;

my $datafile = models('home')->subdir(qw/sql fixtures/)->file('default.pl');
do $datafile or die $!;
