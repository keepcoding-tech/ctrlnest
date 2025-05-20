#!/usr/bin/env perl
use strict;
use warnings;
use lib 'lib';

use CtrlNest;
use CtrlNest::Schema;
use DBIx::Class::DeploymentHandler;

# Get the action from the command line
my $action = shift @ARGV or die "Usage: $0 [install|upgrade]\n";

# Get connection string from ctrl_nest.yml
my $pg_dsn  = $ENV{DBI_DSN};
my $pg_user = $ENV{DBI_USER};
my $pg_pass = $ENV{DBI_PASS};

# Connect DB
my $schema = CtrlNest::Schema->connect($pg_dsn, $pg_user, $pg_pass);

my $dh = DBIx::Class::DeploymentHandler->new({
  schema              => $schema,
  script_directory    => 'db',
  databases           => 'PostgreSQL',
  sql_translator_args => { add_drop_table => 0 },
  force_overwrite     => 1,
  install_version     => CtrlNest::Schema->VERSION,
});

# Run the action for install
if ($action eq 'install') {
  $dh->prepare_install;
  $dh->install;

  print "\n === Database installed === \n";

  exit;
}

# Run the action for upgrade
if ($action eq 'upgrade') {
  $dh->prepare_upgrade;
  $dh->upgrade;

  print "\n === Database upgraded === \n";

  exit;
}

# Invalid action
die "\n Unknown action: $action (use install or upgrade)\n";

1;
