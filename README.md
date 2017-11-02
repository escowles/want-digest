## Want-Digest header support for Nginx

This Perl module enables support for the Want-Digest header in Nginx.  When a
client request includes this header, Nginx will first look for a pre-generated
checksum file, and use the checksum in the file if it is available.  If not, it
will generate a new checksum (which requires reading the entire file from disk).

### Acknowledgements

Based on sample code found at https://gist.github.com/sivel/1870822 and
https://blog.rackspace.com/add-the-content-md5-http-header-to-nginx
