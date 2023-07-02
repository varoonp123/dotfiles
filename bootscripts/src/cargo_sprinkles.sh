#!/usr/bin/env bash
set -Eeuo pipefail

rustup default nightly
cargo install tokei xsv bat git-diff
cargo install --features "parquet/cli"  parquet
