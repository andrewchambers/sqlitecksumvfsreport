#!/bin/sh
set -ex

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
CUR_DIR=$(pwd -P)
echo "$SCRIPT_DIR"
cd "$SCRIPT_DIR" || { echo "fatal error" >&2; exit 1; }

SQLITE_VERSION=3360000
YEAR=2021

# Download and extract amalgamation
SQLITE=sqlite-amalgamation-$SQLITE_VERSION
curl -O https://sqlite.org/$YEAR/$SQLITE.zip
unzip -p "$SQLITE.zip" "$SQLITE/sqlite3.h" > "$SCRIPT_DIR/sqlite3.h"
unzip -p "$SQLITE.zip" "$SQLITE/sqlite3ext.h" > "$SCRIPT_DIR/sqlite3ext.h"
unzip -p "$SQLITE.zip" "$SQLITE/sqlite3.c" > "$SCRIPT_DIR/sqlite3.c"
unzip -p "$SQLITE.zip" "$SQLITE/shell.c" > "$SCRIPT_DIR/shell.c"
rm -f "$SQLITE.zip"

# Download and extract extra extensions
SQLITE=sqlite-src-$SQLITE_VERSION
curl -O https://sqlite.org/$YEAR/$SQLITE.zip
unzip -p "$SQLITE.zip" "$SQLITE/ext/misc/cksumvfs.c" > "$SCRIPT_DIR/cksumvfs.c"
rm -f "$SQLITE.zip"
