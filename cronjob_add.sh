#!/bin/bash

# 크론탭에서 제거할 구문
CRON_JOB="* * * * * sudo /home/ubuntu/project-log/resource_usage.sh"

# 현재 사용자 크론탭을 임시 파일에 백업
crontab -l > current_crontab.txt

# 임시 파일에서 특정 구문을 포함하지 않는 라인만을 새로운 파일로 저장
grep -v "$CRON_JOB" current_crontab.txt > new_crontab.txt

# 새롭게 구문 추가
echo "$CRON_JOB" >> new_crontab.txt

# 새로운 크론탭 파일을 적용
sudo crontab new_crontab.txt

whoami

# 임시 파일 삭제
sudo rm current_crontab.txt new_crontab.txt

echo "크론탭에서 '$CRON_JOB' 구문을 갱신했습니다."
