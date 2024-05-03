#!/bin/bash

#
# IMPORTANT
# You have to customize this script (directories etc.) for your actual environment.
# All entries which need to be customized are tagged with "TODO".
#

echo "Load config: ${0}"

# Variables
backupMainDir=$1

if [ -z "$backupMainDir" ]; then
	# TODO: The directory where you store the dolibarr backups (when not specified by args)
    backupMainDir='/backup/dolibarr'
fi

currentDate=$(date +"%Y%m%d_%H%M%S")

# The actual directory of the current backup - this is a subdirectory of the main directory above with a timestamp
backupdir="${backupMainDir}/${currentDate}/"

pathTodolibarr=$2

if [ -z "$pathTodolibarr" ]; then
# TODO: The directory of your dolibarr documents (this is a directory under your web root)
pathTodolibarr='/html/dolibarr/documents'
fi

# TODO: You may wish to backup some other files
dolibarrBackupFiles='/html/htdocs/conf/conf.php'

# TODO: The maximum number of backups to keep (when set to 0, all backups are kept)
maxNrOfBackups=12

# File names for backup files
nameBackupFileDir="${currentDate}_dolibarro-data.tar.gz"

# TODO: SSH server
remoteBackup='user@example.com'

# TODO: Remote path
remotePath='/path/to/remote/backup/directory'
