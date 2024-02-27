#!/usr/bin/env bash
set -xEeuo pipefail

# Mounted disk. This might change. No compression because this is mainly images and audio, in already compressed
# formats, so extra compression just wastes energy.
(cd /media/personal/data/ && tar -cf ~/latest_media_backup.tar ./)

# More than 1000 requests and we risk getting higher s3 bills.
rclone copyto --s3-storage-class=GLACIER_IR --s3-max-upload-parts=256 --s3-upload-concurrency=32 --progress --max-transfer=25G \
        ~/latest_media_backup.tar "shivaji-nonroot:shivaji-backup/data/media/media_backup_$(date +%F).tar"

