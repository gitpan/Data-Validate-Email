#!/usr/bin/perl

# -------------------------------------------------------------------------------
# test harness for Data::Validate::is_domain
#
# Author: Richard Sonnen (http://www.richardsonnen.com/)
# -------------------------------------------------------------------------------

use lib './t';
use ExtUtils::TBone;

use lib './blib';
use Data::Validate::Email qw(is_domain);

my $t = ExtUtils::TBone->typical();

$t->begin(10);
$t->msg("testing is_domain...");

# valid
$t->ok(defined(is_domain('test.com')), 'test.com');
$t->ok(defined(is_domain('sub.test.com')), 'sub.test.com');
$t->ok(defined(is_domain('sub-test.com')), 'sub-test.com');
$t->ok(defined(is_domain('sub-test.com.au')), 'sub-test.com.au');


# invalid
$t->ok(!defined(is_domain('')), "bad: ''");
$t->ok(!defined(is_domain('host')), "bad: host");
$t->ok(!defined(is_domain('sonnen@frii.com')), 'bad: sonnen@frii.com');
$t->ok(!defined(is_domain('test dot.com')), "bad: test dot.com");



# as an object
my $v = Data::Validate::Email->new();
$t->ok(defined($v->is_domain('test.com')), 'test.com (object)');
$t->ok(!defined($v->is_domain('foobar@bar.com')), 'bad: foobar@bar.com (object)');

# we're done
$t->end();

