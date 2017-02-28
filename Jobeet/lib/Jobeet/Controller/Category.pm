package Jobeet::Controller::Category;
use Ark 'Controller';

use Jobeet::Models;

# テストすべきこと
# 
# ・/category/{category_name}で正しくコントローラーが呼ばれているか？
# ・存在しない場合ただしく404ページが表示されるかどうか
# ・存在するカテゴリの場合 stash にただしくデータが入っているかどうか
# ・page パラメータがわたされたときページオブジェクトが連動しているかどうか
# 
sub show :Path :Args(1) {
    my ($self, $c, $category_name) = @_;

    my $category = models('Schema::Category')->find({ slug => $category_name })
        or $c->detach('/default');

    $c->stash->{category}   = $category;
    $c->stash->{jobs}       = $category->get_active_jobs({
        rows => models('conf')->{max_jobs_on_category},
        page => $c->req->parameters->{page} || 1,
    });
}


sub atom :Local {
    my ($self, $c) = @_;
    $c->res->content_type('application/atom+xml; charset=utf-8');
}



1;