use 5.10;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Template::Piccolo',
    AUTHOR           => q{Peter Mottram (SysPete) <peter@sysnix.com>},
    VERSION_FROM     => 'lib/Template/Piccolo.pm',
    ABSTRACT_FROM    => 'lib/Template/Piccolo.pm',
    LICENSE          => 'perl_5',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.10,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Template-Piccolo-*' },
);
