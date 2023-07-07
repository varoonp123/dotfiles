#!/usr/bin/env bash
set -xEeuo pipefail

# Ignore build artifacts for JS, python, rust 
tar -b196 --checkpoint=5000 --checkpoint-action="echo=#%u: %T" -I"xz -9 -T0" --totals -C ~/ -pcf  latest_backup.tar.xz \
        --exclude "node_modules" --exclude "venv" --exclude "target"  \
        Downloads/ Documents/ snap/zotero-snap/common/Zotero/*.sqlite Music/ Pictures/

# More than 500 requests and we risk getting higher s3 bills.
rclone copyto --s3-storage-class=GLACIER_IR --s3-upload-concurrency=12 --progress --s3-max-upload-parts=256 \
        ~/latest_backup.tar.xz "aws-s3-root:shivaji-backup/data/backup_$(date +%F).tar.xz"
