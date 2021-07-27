# Bug report for sqlite3

- backup.sendlog is a backup sendlog (sqlite3 database) created by backup tool https://bupstash.io .
- enabling checksums on this file following https://www.sqlite.org/cksumvfs.html produces invalid checksums for included database.
- Read download_sqlite3.sh and run to download the affected sqlite3 version (current release).
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

Corresponding sqlite3 forum post: https://sqlite.org/forum/forumpost/e168e116a3