#!/bin/bash

LOG_FILE="/var/log/app_log/resource_usage.log"

EMAIL="gusth1111@naver.com"

SUBJECT="AUTO LOGFILE SENDING"

BODY="PLEASE CHECK ATTACHMENT"

echo "${BODY} | mutt -s "${SUBJECT}" -a "${LOG_FILE}" -- "${EMAIL}"
