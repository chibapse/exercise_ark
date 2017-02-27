#!/usr/bin/env perl

use strict;
use warnings;
use FindBin::libs;

use Jobeet::Models;
use DateTime;

my $job_rs = models('Schema::Job');
my $cat_rs = models('Schema::Category');

# create default Categories
for my $category_name (qw/Design Programming Manager Administrator/) {
    models('Schema::Category')->create({ name => $category_name });
}


# create default Jobs
my $programming_model       = models('Schema::Category');
print "$programming_model\n";
my $programming_category    = $programming_model->find({ name => 'Programming' });
print "$programming_category\n";

print "my programming_category";

$programming_category->add_to_jobs({
    type         => 'full-time',
    company      => 'Sensio Labs',
    logo         => 'sensio-labs.gif',
    url          => 'http://www.sensiolabs.com/',
    position     => 'Web Developer',
    location     => 'Paris, France',
    description  => q[You've already developed websites with symfony and you want to work with Open-Source technologies. You have a minimum of 3 years experience in web development with PHP or Java and you wish to participate to development of Web 2.0 sites using the best frameworks available.],
    how_to_apply => 'Send your resume to fabien.potencier [at] sensio.com',
    is_public    => 1,
    is_activated => 1,
    token        => 'job_sensio_labs',
    email        => 'job@example.com',
    expires_at   => '2010-10-10',
});



my $design_category = models('Schema::Category')->find({ name => 'Design' });

print "my design_category";


$design_category->add_to_jobs({
    type         => 'part-time',
    company      => 'Extreme Sensio',
    logo         => 'extreme-sensio.gif',
    url          => 'http://www.extreme-sensio.com/',
    position     => 'Web Designer',
    location     => 'Paris, France',
    description  => q[Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Utenim ad minim veniam, quis nostrud exercitation ullamco laborisnisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in. Voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpaqui officia deserunt mollit anim id est laborum.],
  how_to_apply   => 'Send your resume to fabien.potencier [at] sensio.com',
    is_public    => 1,
    is_activated => 1,
    token        => 'job_extreme_sensio',
    email        => 'job@example.com',
    expires_at   => '2010-10-10',
});

# # データを追加する必要性あり。
# my $cat_programming = $cat_rs->find({ name => 'Programming' });

# for my $i (100 .. 130) {
#     my $job = $job_rs->create({
#         category_id  => $cat_programming->id,
#         company      => "Company $i",
#         position     => 'Web Developer',
#         location     => 'Paris, France',
#         description  => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.',
#         how_to_apply => "Send your resume to lorem.ipsum [at] company_${i}.sit",
#         is_public    => 1,
#         is_activated => 1,
#         token        => "job_$i",
#         email        => 'job@example.com',
#     });
# }