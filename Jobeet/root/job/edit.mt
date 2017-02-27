? my $form = $c->stash->{form};
? my $job = $c->stash->{job};

? extends 'common/jobs_base';

? block content => sub {

 <div id="job_actions">
  <h3>Admin</h3>
  <ul>
? if (!$job->is_activated) {
      <li><a href="<?= $c->uri_for('/job', $job->token, 'edit') ?>">Edit</a></li>
      <li><a href="<?= $c->uri_for('/job', $job->token, 'publish') ?>">Publish</a></li>
? }
    <li><a href="<?= $c->uri_for('/job', $job->token, 'delete') ?>" onclick="return confirm('Are you sure?')">Delete</a></li>

? if ($job->is_activated) {
    <li<?= $job->expires_soon ? ' class="expires_soon"' : '' ?>>
? if ($job->is_expired) {
          Expired
? } else {
          Expires in <strong><?= $job->days_before_expired ?></strong> days
? }

? if ($job->expires_soon) {
         - <a href="">Extend</a> for another <?= Jobeet::Models->get('conf')->{active_days} ?> days
? }
      </li>
? } else {
      <li>
        [Bookmark this <a href="<?= $c->req->uri ?>">URL</a> to manage this job in the future.]
      </li>
? }
  </ul>
</div>   

<h1>Edit Job</h1>

?= include('job/_partial_form', $form);


? } # endblock content