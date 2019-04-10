package APIXU::API::APIXU;
use strict;
use warnings;

use LWP::UserAgent;
use JSON;

my $json = JSON->new->allow_nonref;

our $VERSION = 0.3;

use constant {
    API_URL => 'http://api.apixu.com/v1/',
    FORMAT => 'json',
    WEATHER_CONDITIONS_URL => 'http://www.apixu.com/doc/Apixu_weather_conditions',
    HTTP_TIMEOUT => 20,
    HTTP_STATUS_INTERNAL_SERVER_ERROR => 500,
};

sub new {
    my $class = shift;
    my $self = {
        '_api_key' => shift
    };
    bless $self, $class;
    return $self;
}

sub conditions {
    my $url = WEATHER_CONDITIONS_URL.".".FORMAT;
    return &get_api_response($url);
}

sub current {
    my ($self, $query) = @_;
    my $api_key = $self->{'_api_key'};
    my $url = API_URL."current.".FORMAT."?key=$api_key&q=$query";
    return &get_api_response($url);
}

sub forecast {
    my ($self, $query, $days, $hour) = @_;
    my $api_key = $self->{'_api_key'};
    my $url = API_URL."forecast.".FORMAT."?key=$api_key&q=$query&days=$days";

    if (defined $hour) {
        $url .= "&hour=$hour";
    }

    return &get_api_response($url);
}

sub history {
    my ($self, $query, $since, $until) = @_;
    my $api_key = $self->{'_api_key'};
    my $url = API_URL."history.".FORMAT."?key=$api_key&q=$query&dt=$since";

    if (defined $until) {
        $url .= "&end_dt=$until";
    }

    return &get_api_response($url);
}

sub search {
    my ($self, $query) = @_;
    my $api_key = $self->{'_api_key'};
    my $url = API_URL."search.".FORMAT."?key=$api_key&q=$query";
    return &get_api_response($url);
}

sub get_api_response {
    my ($url) = @_;
    my $ua = LWP::UserAgent->new();
    $ua->timeout(HTTP_TIMEOUT);

    my $response = $ua->get($url);

    if ($response->code == HTTP_STATUS_INTERNAL_SERVER_ERROR) {
        my %json_resp = (
            'error' => {
                'code' => 0,
                'message' => $@,
            }
        );
        return \%json_resp;
    }

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
