use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'APIXU::API::APIXU',
    AUTHOR       => q{Andrei Avram <avramandrei@ymail.com>},
    VERSION_FROM => 'APIXU.pm',
    ABSTRACT     => 'Perl module for Apixu Weather API',
    ( $ExtUtils::MakeMaker::VERSION >= 7.34
        ? ( 'LICENSE' => 'perl' )
        : () ),
    PL_FILES  => {},
    PREREQ_PM => {
        'LWP::UserAgent' => 6.15,
        'JSON' => 4.01,
    }
);
