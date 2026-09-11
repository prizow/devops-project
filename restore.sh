#!/bin/bash

# Перевіряємо, чи вказали файл при запуску
if [ -z "$1" ]; then
  echo "Помилка: Вкажи шлях до файлу бекапу!"
  echo "Приклад: ./restore.sh backups/db_backup_2026-09-11_15-00-00.sql"
  exit 1
fi

BACKUP_FILE=$1

# Перевіряємо, чи взагалі існує такий файл
if [ ! -f "$BACKUP_FILE" ]; then
  echo "Помилка: Файл $BACKUP_FILE не знайдено!"
  exit 1
fi

echo "Відновлюємо базу даних з файлу $BACKUP_FILE..."

# Передаємо вміст файлу всередину контейнера на команду psql
cat "$BACKUP_FILE" | docker exec -i postgres_db psql -U devops_user -d devops_db

echo "Успішно! Базу відновлено."

