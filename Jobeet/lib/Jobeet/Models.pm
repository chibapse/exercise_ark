package Jobeet::Models;
use strict;
use warnings;
use Ark::Models '-base';
use Cache::FastMmap;

register Schema => sub {
    my $self = shift;

    # 設定ファイルを読み込んでいる
    my $conf = $self->get('conf')->{database}
        or die 'require database config';

    $self->ensure_class_loaded('Jobeet::Schema');
    Jobeet::Schema->connect(@$conf);
};


for my $table (qw/Job Category CategoryAffiliate Affiliate/) {
    # モデルの登録をしている
    register "Schema::$table" => sub {
        my $self = shift;
        $self->get('Schema')->resultset($table);
    };

    # Schema/Result/以下を自動で登録
    autoloader qr/^Schema::/ => sub {
        my ($self, $name) = @_;

        my $schema = $self->get('Schema');
        for my $t ($schema->sources) {
            $self->register( "Schema::$t" => sub { $schema->resultset($t) });
        }
    };
}

# もしかして、今はRedisを使っている？
register cache => sub {
    my $self = shift;

    my $conf = $self->get('conf')->{cache}
        or die 'require cache config';

    $self->ensure_class_loaded('Cache::FastMmap');
    Cache::FastMmap->new(%$conf);
};



1;
