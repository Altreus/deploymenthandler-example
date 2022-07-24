#!perl

use strict;
use warnings;

use DBIx::Class::DeploymentHandler;
use MyApp::Schema;

my $dh = DBIx::Class::DeploymentHandler->new(
    schema => MyApp::Schema->connect('dbi:SQLite:test.db'),
    to_version => MyApp::Schema->schema_version,
);

#$dh->prepare_install;
#$dh->install;

$dh->prepare_deploy;
$dh->prepare_upgrade;
$dh->upgrade;
