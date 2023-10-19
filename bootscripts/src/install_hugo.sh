#!/usr/bin/env bash
set -ex
echo "Building hugo from source"
go install -tags extended github.com/gohugoio/hugo@latest
