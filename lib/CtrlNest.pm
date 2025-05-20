package CtrlNest;
use Mojo::Base 'Mojolicious', -signatures;

use CtrlNest::Schema;

# This method will run once at server start
sub startup ($self) {

  # Load configuration from config file
  # my $config = $self->plugin('NotYAMLConfig');

  # Configure the application
  # $self->secrets($config->{secrets});
  $self->secrets($ENV{MOJO_SECRETS});
  $self->sessions->default_expiration(3600);

  # # DB (create connection string)
  # my $dsn  = $config->{pg_dsn}->[0];
  # my $user = $config->{pg_user};
  # my $pass = $config->{pg_pass};
  my $pg_dsn  = $ENV{DBI_DSN};
  my $pg_user = $ENV{DBI_USER};
  my $pg_pass = $ENV{DBI_PASS};

  # Connect DB
  my $schema = CtrlNest::Schema->connect($pg_dsn, $pg_user, $pg_pass);

  $self->helper(db => sub { $schema });

  # Router
  my $r = $self->routes;

  # ========================================================================== #

  # Auth GET
  $r->get('/lockscreen')->to('Auth#lockscreen');
  $r->get('/login')->to('Auth#login');

  # Auth POST
  $r->post('/auth')->to('Auth#auth');
  $r->post('/logout')->to('Auth#logout');

  # ========================================================================== #

  # Dashboard GET
  $r->get('/')->to('Dashboard#home');
  $r->get('/home')->to('Dashboard#home');

  # ========================================================================== #

  return;
}

1;
