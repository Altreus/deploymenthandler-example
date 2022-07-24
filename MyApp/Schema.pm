package MyApp::Schema;

use warnings;
use strict;

use base qw/DBIx::Class::Schema/;
__PACKAGE__->load_namespaces;

sub schema_version {1}

1;
