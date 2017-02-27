package Jobeet::Controller::Job;
use Ark 'Controller';

use Jobeet::Models;

# /job/
sub index :Path {
    my ($self, $c) = @_;

    # $c->stash->{jobs} = models('Schema::Job');
    # $c->stash->{jobs} = models('Schema::Job')->get_active_jobs;
    $c->stash->{categories} = models('Schema::Category')->get_with_jobs;
}

# /job/{job_token} (詳細)
sub show :Path :Args(1) {
    my ($self, $c, $job_token) = @_;

}

# /job/create (新規作成)
sub create :Local  {
    my ($self, $c) = @_;    
}

# TODO 複雑なURLに対応して。。。
sub job :Chained('/') :PathPart :CaptureArgs(1) {
    my ($self, $c, $job_token) = @_;
}

# /job/{job_token}/edit (編集)
sub edit :Chained('job') :PathPart :Args(0){
    my ($self, $c) = @_;
}

# /job/{job_token}/delete (削除)
sub delete :Chained('job') :PathPart :Args(0) {
    my ($self, $c) + @_;
}

1;
