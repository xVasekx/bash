#!/bin/bash

cat apache_logs | awk '{print $4}' | grep -Eo "[0-9]{2}\/[A-Z][a-z]{2}\/[0-9]{4}.*" | sort | awk 'NR == 1{print} END{print}' > time
echo "Временной диапазон с $(cat time | awk 'NR == 1{print}') до $(cat time | awk 'END{print}')"
echo "----"
echo "20 Ip адресов с наибольшем кол-вом запросов"
cat apache_logs | awk '{print $1}' | sort | uniq -c | sort -rn | head -n 20
echo "----"
echo "20 URL запросов с этого сервера"
cat apache_logs | awk '{print $7}' | sort | uniq -c | sort -rn | head -n 20
echo "----"
echo "Ошибочные запросы"
cat apache_logs | awk '{print $9}' | grep -Eo "(3|4|5)[0-9]{2}" | sort | uniq
echo "----"
echo "Список кодов ответов сервера"
cat apache_logs | awk '{print $9}'| grep -v "-" | sort | uniq -c | sort -rn
