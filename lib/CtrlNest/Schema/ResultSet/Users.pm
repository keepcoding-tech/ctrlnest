package CtrlNest::Schema::ResultSet::Users;

use strict;
use warnings;

use base qw( DBIx::Class::ResultSet );

################################################################################

sub get_by_username {
  my ($self, $username) = @_;

  # Query the database for the username
  # Find first result only
  my $result_set = $self->find({ username => $username });

  # The result set must exist
  return undef unless defined $result_set;

  # Get the row with all the columns
  my %user = $result_set->get_columns;

  # Return Object
  return \%user;
}

################################################################################

# sub create_user {
#   my ($db, $username, $password, $role) = @_;

#   return undef unless defined $username;
#   return undef unless defined $password;
#   return undef unless defined $role;

#   # Insert the new user
#   my $result_set = $db->resultset('Users')
#     ->create({username => $username, password => $password, role => $role});

#   # Validate insertion
#   return undef unless defined $result_set;

#   # Return the newly create user
#   my %user = $result_set->get_columns;

#   return \%user;
# }

################################################################################

1;
