#!/usr/bin/perl

# -------------------------------------------------------------------------------
# test harness for Data::Validate::is_email
#
# Author: Richard Sonnen (http://www.richardsonnen.com/)
# -------------------------------------------------------------------------------

use lib './t';
use ExtUtils::TBone;

use lib './blib';
use Data::Validate::Email qw(is_email);

my $t = ExtUtils::TBone->typical();

$t->begin(11);
$t->msg("testing is_email...");

# valid
$t->ok(defined(is_email('bob@test.com')), 'bob@test.com');
$t->ok(defined(is_email('bob@test.com.au')), 'bob@test.com.au');
$t->ok(defined(is_email('foo.bob@test.com.au')), 'foo.bob@test.com.au');
$t->ok(defined(is_email('foo-bob@test-com.au')), 'foo-bob@test-com.au');
$t->ok(defined(is_email('foo-bob@test.uk')), 'foo-bob@test.uk');

# invalid
$t->ok(!defined(is_email('')), "bad: ''");
$t->ok(!defined(is_email('foo')), 'bad: foo');
$t->ok(!defined(is_email('foo@bar')), 'bad: foo@bar');
$t->ok(!defined(is_email('foo bar@bar.com')), 'bad: foo bar@bar.com');


# as an object
my $v = Data::Validate::Email->new();
$t->ok(defined($v->is_email('bob@test.com')), 'bob@test.com (object)');
$t->ok(!defined($v->is_email('foo bar@bar.com')), 'bad: foo bar@bar.com (object)');

# we're done
$t->end();

