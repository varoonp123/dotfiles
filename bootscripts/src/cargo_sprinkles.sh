#!/usr/bin/env bash
set -Eeuo pipefail

rustup default nightly
cargo install tokei xsv bat git-delta du-dust
cargo install --features "parquet/cli"  parquet
cargo install --features "simd-accel,pcre2"  ripgrep
