#/bin/dash
LOCK=/tmp/ubuntu-cloud

[ -f $LOCK ] && exit 0
touch $LOCK

fatal() {
  echo "$1"
  exit 1
}

warn() {
  echo "$1"
}
SOURCE=rsync://cloud-images.ubuntu.com/cloud-images

rsync -vazH --timeout=600 --ipv4 --numeric-ids  --delay-updates --delete-delay \
   $SOURCE /data/mirrors/ubuntu-cloud


rm -f $LOCK
