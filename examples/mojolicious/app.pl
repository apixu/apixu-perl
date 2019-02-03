use strict;
use warnings;
use Mojolicious::Lite;
use APIXU::API::APIXU;

my $api_key = $ENV{'APIXUKEY'};
my $apixu = APIXU::API::APIXU->new($api_key);

get '/weather/search' => sub {
    my $c = shift;
    my $q = $c->param('q');
    $c->render(json => $apixu->search($q));
};

app->secrets([$ENV{'SECRET'}]);

app->start;
