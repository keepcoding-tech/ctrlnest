package CtrlNest::Schema::Result::Migrations;

use warnings;
use strict;

use base qw( DBIx::Class::Core );

__PACKAGE__->table('migrations');

__PACKAGE__->add_columns(
  id => {
    data_type         => 'integer',
    is_auto_increment => 1
  },

  version => {
    data_type   => 'varchar',
    size        => 50,
    is_nullable => 0
  },

  applied_at => {
    data_type     => 'timestamp',
    set_on_create => 1,
    default_value => \'CURRENT_TIMESTAMP',
  },

  description => {
    data_type   => 'text',
    is_nullable => 0
  }
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint([qw( version )]);

1;
