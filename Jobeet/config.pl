use strict;
use warnings;

# +{
#     default_view    => 'MT',
# }

my $home = Jobeet::Models->get('home');

return {
    default_view => 'MT',
    active_days => 30,
    max_jobs_on_homepage => 10,
    max_jobs_on_category => 20,

    database => [
        'dbi:SQLite:' . $home->file('database.db'), '', '',
         {
             sqlite_unicode => 1,
         },
    ],

    cache => {
        share_file     => $home->file('tmp', 'cache')->stringify,
        unlink_on_exit => 0,
    },

};

#
# MySQLを使用する場合の設定
#
# return {
#     database => [
#         'dbi:mysql:database_name', 'username', 'password',
#          {
#              mysql_enable_utf8 => 1,
#              on_connect_do     => ['SET NAMES utf8'],
#          },
#     ],
# };