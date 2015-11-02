#!/usr/bin/env bash

MYSQLDUMP="$( \which mysqldump 2>/dev/null )"
MYSQLDUMPOPTS="diaspora_production"
DUMPDATE="$( \date +"%Y-%m-%d")"
DUMPNAME="diaspora_production_$DUMPDATE.sql.asc"
TARNAME="amalgama_$DUMPDATE.tar"

${MYSQLDUMP} ${MYSQLDUMPOPTS} | gpg --encrypt -r support@canfly.org > ${DUMPNAME}

tar cvz /home/diaspora/amalgama/| gpg --encrypt -r "support@canfly.org" > ${TARNAME}.gpg

./go.sh ${DUMPNAME}
./go.sh ${TARNAME}.gpg

#rm -f $(DUMPNAME)
