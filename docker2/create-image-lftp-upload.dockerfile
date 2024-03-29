

docker run -d --entrypoint watch --name upload-tests -v ${PWD}/../site/_site:/site alpine "date"


docker run -d --entrypoint watch --name upload-tests -v /Users/cristi/IdeaProjects/cristian-sulea-net/site:/site alpine "date"

docker exec -it container-name sh

apk --no-cache add lftp

lftp ftp.sulea.net

login cristi@tests.sulea.net c@tsn/1

set ssl:verify-certificate false

mirror --delete -P 10 /site/_site/ / --reverse

lftp -u "cristi@tests.sulea.net","c@tsn/1" ftp.sulea.net <<EOF
set ssl:verify-certificate false;
ls;
mirror --delete -P 10 /site/_site/ / --reverse;
ls;
exit;
EOF

