---
title: osxphotos
---

OSX Photos is a powerful photo management application that allows you to organize and manage your photos on your Mac. It provides a user-friendly interface for importing, organizing, and exporting photos, as well as editing and sharing photos.

### Exporting Photos from iPhoto (older version of OSX Photos)

The following command will export photos from iPhoto to a directory called `export_Photos_052021`

```bash
osxphotos export ~/Volumes/T71/backups/photos_backup_01032024/export_Photos_052021 \
--ramdb \
--update \
--exiftool \
--touch-file \
--library ~/Volumes/T71/backups/photos_backup_01032024/Photos_052021.migratedphotolibrary
```

Description of each option:

- `--ramdb`: Uses the RAM disk as the database for the export. This is faster than using the default SQLite database, but it may not be available on all systems.
- `--update`: Updates the database with the latest changes from iPhoto library.
- `--exiftool`: Uses exiftool to extract metadata from the photos.
- `--touch-file`: Updates the file modification time of the exported photos to match the modification time of the original photos.
- `--library`: Specifies the path to the iPhoto library to be exported.


### Compare two directories with exported photos to see if they are identical based on file size and name

```bash
diff -qr /path/to/dir1 /path/to/dir2
```
