#!/usr/bin/env bash

fatal()
{
  echo "FATAL: $1" >&2
  exit 1
}


  YANDEXDISK_TOKEN=$(cat YANDEXDISK.TOKEN)
  export YANDEXDISK_TOKEN

upload_file="$1"
upload_filename="${upload_file##*/}"
_url="https://cloud-api.yandex.net/v1/disk"

temp_file=`mktemp /tmp/.yandex-disk.XXXXXX`
curl_temp`mktemp /tmp/.yandex-disk.curl.XXXXXX`

curl -H "Authorization: OAuth ${YANDEXDISK_TOKEN}" -G "${_url}/resources/upload" --data-urlencode "path=backup/${upload_filename}" > ${temp_file}

if [ $? -eq 0 ]
then
  _upload_url=`cat "${temp_file}" | sed -e 's/^.*"href":"\([^"]*\)".*$/\1/'`
  curl -v "${_upload_url}" -T "upload_file" > ${curl_temp}
  cat ${curl_temp}
  rm -f "${temp_file}"
  rm -f "${curl_temp}"
else
  fatal "error in line"
fi
