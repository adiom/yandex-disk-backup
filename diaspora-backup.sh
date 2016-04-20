#!/usr/bin/env bash

FILESUFFIX="$( \date +"%Y-%m-%d")"

MYSQLDUMP="$( \which mysqldump 2>/dev/null )"
MYSQLDUMPOPTS="diaspora_production"
DUMPNAME="diaspora_production_$FILESUFFIX.sql.gpg"


TAR="$( \which tar 2>/dev/null )"
TAROPTS="-cz /home/diaspora/amalgama"
TARNAME="amalgama_$FILESUFFIX.tar.gpg"

GPGCLI="gpg --encrypt -r support@canfly.org"

${MYSQLDUMP} ${MYSQLDUMPOPTS} | ${GPGCLI} > ${DUMPNAME}

${TAR} ${TAROPTS} | ${GPGCLI} > ${TARNAME}

./go.sh ${DUMPNAME}
./go.sh ${TARNAME}

rm -f ${DUMPNAME}
rm -f ${TARNAME}