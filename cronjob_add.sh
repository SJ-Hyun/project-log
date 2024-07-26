#!/bin/bash
echo "변경 전 크론탭 실행파일입니다."
crontab -l

# 크론탭에서 제거할 구문
CRON_JOB1="* * * * * sh /home/ubuntu/project-log/resource_usage.sh"
CRON_JOB2="* */3 * * * sh /home/ubuntu/project-log/mail.sh"

# 현재 사용자 크론탭을 임시 파일에 백업
crontab -l > current_crontab.txt

# 임시 파일에서 특정 구문을 포함하지 않는 라인만을 새로운 파일로 저장
grep -v "* * * * * sh /home/ubuntu/project-log/resource_usage.sh" current_crontab.txt > temp_crontab.txt
echo "-----------------------------"
echo "current에서 1번 구문 없앤 후"
echo "*temp_crontab파일*"
cat temp_crontab.txt
echo "-----------------------------"
grep -v "* */3 * * * sh /home/ubuntu/project-log/mail.sh" temp_crontab.txt > new_crontab.txt
echo "-----------------------------"
echo "temp에서 2번 구문 없앤 후"
echo "*new_crontab파일*"
cat new_crontab.txt
echo "-----------------------------"

# 새롭게 구문 추가
echo "$CRON_JOB1" >> new_crontab.txt
echo "$CRON_JOB2" >> new_crontab.txt

# 새로운 크론탭 파일을 적용
crontab new_crontab.txt

echo "변경 후 크론탭 실행파일입니다."
crontab -l

# 임시 파일 삭제
sudo rm current_crontab.txt temp_crontab.txt new_crontab.txt 

echo "크론탭에서 구문을 갱신했습니다."
