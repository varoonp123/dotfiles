#!/usr/bin/env bash
set -Eeuo pipefail

rustup default nightly
cargo install tokei xsv
cargo install --features "parquet/cli"  parquet
