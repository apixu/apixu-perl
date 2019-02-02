#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use lib 'APIXU/API';
use APIXU;

my $api_key = $ENV{'APIXUKEY'};
my $apixu = APIXU::API::APIXU->new($api_key);

my $query = 'Paris';
my $location = $apixu->current($query);

print $location->{location}->{name};
print "\n";
print $location->{location}->{country};
print "\n";
print $location->{current}->{temp_c};
print "\n";

<<"#";
{
   "location":{
      "name":"London",
      "region":"City of London, Greater London",
      "country":"United Kingdom",
      "lat":51.52,
      "lon":-0.11,
      "tz_id":"Europe/London",
      "localtime_epoch":1548103139,
      "localtime":"2019-01-21 20:38"
   },
   "current":{
      "last_updated_epoch":1548102624,
      "last_updated":"2019-01-21 20:30",
      "temp_c":4.0,
      "temp_f":39.2,
      "is_day":0,
      "condition":{
         "text":"Clear",
         "icon":"//cdn.apixu.com/weather/64x64/night/113.png",
         "code":1000
      },
      "wind_mph":6.9,
      "wind_kph":11.2,
      "wind_degree":210,
      "wind_dir":"SSW",
      "pressure_mb":1015.0,
      "pressure_in":30.4,
      "precip_mm":0.0,
      "precip_in":0.0,
      "humidity":81,
      "cloud":0,
      "feelslike_c":1.2,
      "feelslike_f":34.2,
      "vis_km":10.0,
      "vis_miles":6.0,
      "uv":0.0
   }
}
#
