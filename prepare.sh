#!/bin/sh
set -eu

cd "$(dirname "$0")"

mani sync
mani run prepare

