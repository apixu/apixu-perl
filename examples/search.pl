#!/usr/bin/perl
use strict;
use warnings;

use lib 'APIXU/API';
use APIXU;

my $api_key = $ENV{'APIXUKEY'};
my $apixu = APIXU::API::APIXU->new($api_key);

my $query = 'Paris';
my $search = $apixu->search($query);

foreach my $location(@$search) {
    print $location->{id};
    print "\n";
    print $location->{name};
    print "\n";
    print $location->{region};
    print "\n";
    print "\n";
}

<<"#";
[
   {
      "id":2801268,
      "name":"London, City of London, Greater London, United Kingdom",
      "region":"City of London, Greater London",
      "country":"United Kingdom",
      "lat":51.52,
      "lon":-0.11,
      "url":"london-city-of-london-greater-london-united-kingdom"
   }
]
#
