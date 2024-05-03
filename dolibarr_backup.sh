#!/bin/bash

#
# Bash script for creating backups of Dolibarr.
#
# Version 1.1.1
#

#
# IMPORTANT
# You have to customize the following config files: .main.config.sh and .database.config.cnf
#

. config/.main.config.sh

# Function for error messages
errorecho() { cat <<< "$@" 1>&2; }

#
# Print information
#
echo "Backup directory: ${backupMainDir}" ${currentDate}


#
# Check if backup dir already exists
#
if [ ! -d "${backupdir}" ]
then
	mkdir -p "${backupdir}"
else
	errorecho "ERROR: The backup directory ${backupdir} already exists!"
	exit 1
fi

#
# Backup Dolibarr
#
echo "2. Backup Dolibarr's files..."
tar -cpzf "${backupdir}/${nameBackupFileDir}" "${pathTodolibarr}" ${dolibarrBackupFiles}
echo "File backup completed!"
echo

#
# Delete old backups
#
if [ ${maxNrOfBackups} != 0 ]
then
	nrOfBackups=$(ls -l ${backupMainDir} | grep -c ^d)

	if [[ ${nrOfBackups} > ${maxNrOfBackups} ]]
	then
		echo "3. Removing old backups..."
		ls -t ${backupMainDir} | tail -$(( nrOfBackups - maxNrOfBackups )) | while read -r dirToRemove; do
			echo "${dirToRemove}"
			rm -r "${backupMainDir}/${dirToRemove:?}"
			echo "Removing old backups completed!"
			echo
		done
	fi
fi

rsync -e ssh -avz ${backupdir}/* ${remoteBackup}:${remotePath}
echo
echo "DONE!"
echo "Backup created: ${backupdir}"