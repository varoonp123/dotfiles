#!/usr/bin/env bash
set -Eeuo pipefail

rustup default nightly
cargo install tokei xsv parquet
