# Bug report for sqlite3

- backup.sendlog is a backup sendlog (sqlite3 database) created by backup tool https://bupstash.io .
- enabling checksums on this file following https://www.sqlite.org/cksumvfs.html produces invalid checksums for included database.
- Read repro.sh and run to reproduce the issue.