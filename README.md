# Bug report for sqlite3

- backup.sendlog is a backup sendlog (sqlite3 database) created by backup tool https://bupstash.io .
- enabling checksums on this file following https://www.sqlite.org/cksumvfs.html produces invalid checksums for included database.
- Read repro.sh and run to reproduce the issue.

```
$ ./repro.sh
+ CC=gcc
+ test -e sqlite3-shell
+ test -e cksumvfs.so
+ cp backup.sendlog backup.copy.sendlog
+ ./sqlite3-shell
ok
+ ./sqlite3-shell
8
Error: near line 5: disk I/O error
```