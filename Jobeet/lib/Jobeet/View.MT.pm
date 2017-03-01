has '+macro' => default => sub {
    return {
        sha1_hex => \&Digest::SHA1::sha1_hex,
        x        => sub { Jobeet->context->localize(@_) },
    },
};