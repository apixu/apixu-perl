#!/usr/bin/perl
use strict;
use warnings;

use APIXU::API::APIXU;

my $api_key = $ENV{'APIXUKEY'};
my $apixu = APIXU::API::APIXU->new($api_key);

my $query = 'London';
my $search = $apixu->search($query);

if (ref $search eq 'HASH' && exists $search->{'error'}) {
    print $search->{'error'}->{'code'};
    print "\n";
    print $search->{'error'}->{'message'};
    exit 1;
}

foreach my $location(@$search) {
    print $location->{id};
    print "\n";
    print $location->{name};
    print "\n";
    print $location->{region};
    print "\n";
    print "\n";
}
