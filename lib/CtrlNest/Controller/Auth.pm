package CtrlNest::Controller::Auth;
use Mojo::Base 'Mojolicious::Controller', -signatures;

################################################################################

sub auth {
  my $self = shift;

  # Get username and password parameters
  my $username = $self->param('username');
  my $password = $self->param('password');

  # Search for the user and validate the authentication
  my $user = $self->app->helpers('Auth')
    ->validate_authentication($username, $password);

  # Redirect user to the dashboard page if success
  if ($user) {
    $self->session(username => $user->{username}, role => $user->{role});
    return $self->redirect_to('/home');
  }

  # Display validation error and redirect back to login
  $self->flash(error => 'Invalid Credentials');
  return $self->redirect_to('/login');
}

################################################################################

sub lockscreen {
  my $self = shift;

  # Get the username before ending the session
  my $username = $self->session('username');

  # End session
  $self->session(expires => 1);

  # Render template "auth/lockscreen.html.ep"
  return $self->render(
    layout      => 'auth',
    title       => 'Lockscreen',
    page_layout => 'lockscreen',
    username    => $username
  );
}

################################################################################

sub login {
  my $self = shift;

  # Render template "auth/login.html.ep"
  return $self->render(
    layout      => 'auth',
    title       => 'Login',
    page_layout => 'login-page'
  );
}

################################################################################

sub logout {
  my $self = shift;

  # End session
  $self->session(expires => 1);

  # Redirect user to the login page
  return $self->redirect_to('/login');
}

################################################################################

1;
