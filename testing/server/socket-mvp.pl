#!/usr/bin/env perl

use strict;
use IO::Socket::INET;

my $host = shift;
my $port = shift || 25;

my $socket = IO::Socket::INET->new(
	PeerAddr  => $host,
	PeerPort  => $port,
	Proto     => 'tcp',
	Timeout   => 30,
);
if ($@) {
	die "Unable to connect to $host:$port:\n\t$@\n";
}
print "Connected to $host:$port\n";

my $msg;
$socket->recv($msg, 1024);

print "msg = $msg\n";
