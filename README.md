# Bash

mail.sh - скрипт для CRON, который раз в час будет формировать письмо и отправлять на заданную почту.

В crontab нужно добавить:  0 * * * * ./mail.sh

apache_logs.sh - скрипт который формирует отчет из лога httpd

В отчете информация:
1. Список IP адресов с указанием кол-ва запросов.
2. Список запрашиваемых URL с указанием кол-ва запросов.
3. Ошибки веб-сервера/приложения.
4. Список всех кодов HTTP ответа с указанием их кол-ва.
