use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'ctrl_nest',
  VERSION      => '1.0.0',
  ABSTRACT     => "Your Data’s Cozy Nest",
  AUTHOR       => 'keepcoding.tech',
  LICENSE      => 'mit',
  PREREQ_PM    => {
    'Mojolicious' => '9.40'
  },
  META_MERGE => {
    'meta-spec' => { version => 2 },
    resources   => {
      homepage   => 'https://github.com/keepcoding-tech/ctrlnest#readme',
      repository => {
        type => 'git',
        url  => 'https://github.com/keepcoding-tech/ctrlnest.git',
        web  => 'https://github.com/keepcoding-tech/ctrlnest',
      },
      bugtracker => {
        web => 'https://github.com/keepcoding-tech/ctrlnest/issues',
      },
    },
    keywords => [qw(admin dashboard control panel)],
  },
  test => { TESTS => 't/*.t t/*/*.t' }
);

