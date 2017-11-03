# nginx Embedded Perl module for adding a Digest header using the algorithm
# specified in the Want-Digest header.
#
# Author: Esmé Cowles <escowles@ticklefish.org>
# License: http://www.nginx.org/LICENSE
#
# Derived from example code by Matt Martz <matt@sivel.net>
# Link: https://gist.github.com/1870822#file_content_md5.pm

package WantDigest;
use nginx;
use Digest::MD5;
use Digest::SHA;

sub handler {
    my $r = shift;
    my $filename = $r->filename;
    return DECLINED unless -f $filename;

    my $digest = $r->header_in("Want-Digest");
    return DECLINED unless $digest;
    my $ctx;
    if ( $digest eq "md5" ) {
        $ctx = Digest::MD5->new;
    } elsif ( $digest eq "sha" ) {
        $ctx = Digest::SHA->new(1);
    } elsif ( $digest eq "sha256" ) {
        $ctx = Digest::SHA->new(256);
    } elsif ( $digest eq "sha512" ) {
        $ctx = Digest::SHA->new(512);
    }

    if ( $ctx ) {
      open( FILE, $filename ) or return DECLINED;
      $ctx->addfile( *FILE );
      my $hex = $ctx->hexdigest;
      close( FILE );
      $r->header_out( "Digest", "$digest=$hex" );
    }

    return DECLINED;
}

1;
__END__
