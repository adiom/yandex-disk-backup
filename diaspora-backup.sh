#!/usr/bin/env bash

MYSQLDUMP="$( \which mysqldump 2>/dev/null )"
MYSQLDUMPOPTS="diaspora_production"
DUMPDATE="$( \date +"%Y-%m-%d")"
DUMPNAME="diaspora_production_$DUMPDATE.sql.asc"
TARNAME="amalgama_$DUMPDATE.tar"

${MYSQLDUMP} ${MYSQLDUMPOPTS} | gpg --encrypt -r support@canfly.org > ${DUMPNAME}
tar cvf ${TARNAME} /home/diaspora/amalgama/
gpg --encrypt -r "support@canfly.org" ${TARNAME}

go.sh ${DUMPNAME}

#rm -f $(DUMPNAME)
