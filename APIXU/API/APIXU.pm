package APIXU::API::APIXU;
use strict;
use warnings;

use LWP::UserAgent;
use JSON;

my $json = JSON->new->allow_nonref;
my $api_url = 'https://api.apixu.com/v1/';
my $format = 'json';
my $weather_conditions_url = 'https://www.apixu.com/doc/Apixu_weather_conditions';

sub new {
    my $class = shift;
    my $self = {
        '_api_key' => shift
    };
    bless $self, $class;
    return $self;
}

sub conditions {
    my $url = "$weather_conditions_url.$format";
    return &get_api_response($url);
}

sub current {
    my ($self, $query) = @_;
    my $api_key = $self->{'_api_key'};
    my $url = $api_url."current.$format?key=$api_key&q=$query";
    return &get_api_response($url);
}

sub forecast {
    my ($self, $query, $days) = @_;
    my $api_key = $self->{'_api_key'};
    my $url = $api_url."forecast.$format?key=$api_key&q=$query&days=$days";
    return &get_api_response($url);
}

sub history {
    my ($self, $query, $since) = @_;
    my $api_key = $self->{'_api_key'};
    my $url = $api_url."history.$format?key=$api_key&q=$query&dt=$since";
    return &get_api_response($url);
}

sub search {
    my ($self, $query) = @_;
    my $api_key = $self->{'_api_key'};
    my $url = $api_url."search.$format?key=$api_key&q=$query";
    return &get_api_response($url);
}

sub get_api_response {
    my ($url) = @_;
    my $ua = LWP::UserAgent->new();
    my $response = $ua->get($url);

    my $json_resp = $response->decoded_content;
    my $json_decoded = $json->decode($json_resp);

    if ($response->is_success) {
        return $json_decoded;
    }

    my %json_resp = (
        'error' => {
            'code' => $json_decoded->{error}->{code},
            'message' => $json_decoded->{error}->{message},
        }
    );
    return \%json_resp;

}

1;
