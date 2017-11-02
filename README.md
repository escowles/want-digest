## Want-Digest header support for Nginx

This Perl module enables support for the Want-Digest header in Nginx.  When a
client request includes this header, Nginx will first look for a pre-generated
checksum file, and use the checksum in the file if it is available.  If not, it
will generate a new checksum (which requires reading the entire file from disk).

### Setup

```bash
apt-get install nginx nginx-extras
mkdir /usr/share/nginx/perl
cp ContentMD5.pm /usr/share/nginx/perl
```

See nginx.conf for basic configuration.

### Acknowledgements

Based on sample code by Matt Martz:
* https://gist.github.com/sivel/1870822 and
* https://blog.rackspace.com/add-the-content-md5-http-header-to-nginx
