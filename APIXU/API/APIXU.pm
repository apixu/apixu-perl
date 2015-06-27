package APIXU::API::APIXU;
use strict;

use LWP::UserAgent; 
use HTTP::Request::Common qw{ POST };
use JSON;


my $json = JSON->new->allow_nonref;
my $api_url = 'http://api.apixu.com/v1';

my $current_weather   = '/current.json';
my $forecast_weather  = '/forecast.json';

sub new
{
    my $class = shift;
    my $self = {
        '_api_key' => shift
    };
    bless $self, $class;
    return $self;
}


sub get_current {
    my ($self, $location) = @_;
    my $api_key = $self->{'_api_key'};
    my $url = $api_url.$current_weather."?key=$api_key&q=$location";
    return &get_api_response($url);
}

sub get_forecast {
    my ($self, $location, $days) = @_;
    my $api_key = $self->{'_api_key'};
    my $url = $api_url.$forecast_weather."?key=$api_key&q=$location&days=$days";
    return &get_api_response($url);
}

sub get_api_response {
    my ($url) = @_;
    print "URL=$url<hr>";
    my $ua       = LWP::UserAgent->new();
    my $response = $ua->get( $url );

    if ($response->is_success) {
        my $json_resp = $response->decoded_content;  # or whatever
        my $json_decoded = $json->decode( $json_resp );
        return $json_decoded;
    }
    else {
        my $resp_message = $response->message;  # or whatever
        my %json_resp = (
            'error' => {
                'message'  => $resp_message,
            }
        );
        return \%json_resp;
    }
}

1;