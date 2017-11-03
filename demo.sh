#!/bin/sh

echo ">>>> No Want-Digest header <<<<"
curl -I http://localhost:8080/

echo ">>>> Want-Digest: xyz <<<<"
curl -I -H "Want-Digest: xyz" http://localhost:8080/

echo ">>>> Want-Digest: md5 <<<<"
curl -I -H "Want-Digest: md5" http://localhost:8080/

echo ">>>> Want-Digest: sha <<<<"
curl -I -H "Want-Digest: sha" http://localhost:8080/
