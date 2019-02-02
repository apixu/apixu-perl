#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use lib 'APIXU/API';
use APIXU;

my $api_key = $ENV{'APIXUKEY'};
my $apixu = APIXU::API::APIXU->new($api_key);

my $conditions = $apixu->conditions();

foreach my $c(@$conditions) {
    print $c->{code};
    print "\n";
    print $c->{day};
    print "\n";
    print "\n";
}

<<"#";
[
    {
        "code" : 1000,
        "day" : "Sunny",
        "night" : "Clear",
        "icon" : 113
    }
]
#
