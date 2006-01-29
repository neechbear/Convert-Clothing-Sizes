require 5.005;
use strict;
use ExtUtils::MakeMaker qw(WriteMakefile);

WriteMakefile(
   NAME          => 'Convert::Clothing::Sizes',
   VERSION_FROM  => 'lib/Convert/Clothing/Sizes.pm',
   ABSTRACT_FROM => 'lib/Convert/Clothing/Sizes.pm',
   AUTHOR        => 'Nicola Worthington <nicolaworthington@msn.com>',
   PREREQ_PM     => {
                      'Carp'        => 0,
                     },
);

