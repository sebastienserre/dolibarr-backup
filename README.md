# dolibarr backup

![GitHub all releases](https://img.shields.io/github/downloads/sebastienserre/dolibarr-backup/total?style=flat-square)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/sebastienserre/dolibarr-backup?style=flat-square)

This script is aimed to use on shared hosting's.

Table of Contents:

- [dolibarr backup and ](#dolibarr-piwik-backup-and-restore)
  - [General information's](#general-informations)
  - [What do you need](#what-do-you-need)
  - [How to use this script](#how-to-use-this-script)
    - [Arguments](#arguments)
  - [Tested shared hosting's](#tested-shared-hostings)


## General information's

This tools is based on the Database backup system already available in Dolibarr: https://wiki.dolibarr.org/index.php?title=Backups#:~:text=If%20you%20use%20a%20recent,can%20keep%20all%20default%20values).
It backups the Documents folder  + the config file


## What do you need

- **NO root access. Yeh!**
- Terminal access
- The tar extension
- a SSH access and a second host (or an accessible NAS) to upload backup.

## How to use this script

- After Cloning or downloading the repository duplicate both config files and rename it so that ".example" is removed. Now the config files are no longer tracked by git.
- Then you'll have to change the variable values in the .main.config.sh file. All values which need to be customized are marked with TODO in the script's comments.
- You also have to customized the database credentials in the .database.config.cnf file. You can find your dolibarr credentials under /config/config.ini.php
- For security reasons I recommend to keep the repository files and backup files outside the public folder. The public folder is usually /var/www
- When you have customized the config files you can do both, make a manually backup or create automatic backups via a cronjob
- Add a cron task to automatically perform your backup: 0 0 * * * cd dolibarr-backup-restore/ && sh dolibarr_backup.sh > /path/to/log/dolibarr-logs/backup.log (must exists)

### Arguments

$1 = backupMainDir

**Default:** /backup/dolibarr

---

$2 = pathTodolibarr

**Default:** /html/dolibarr

---

Here is an example:

```$ ./dolibarr_backup.sh /path/to/my/backup-folder /path/to/dolibarr```


## Tested shared hosting's

- [x] O2Switch.fr - Scale'UP
