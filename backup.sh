#!/bin/bash

# Папка, куди будемо зберігати бекапи
BACKUP_DIR="/home/deploy/devops-project/backups"

# Генеруємо поточну дату та час для назви файлу
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
FILE_NAME="db_backup_$DATE.sql"

# Створюємо папку, якщо її раптом немає
mkdir -p $BACKUP_DIR

# Робимо дамп бази даних з контейнера
echo "Починаємо створення бекапу..."
docker exec postgres_db pg_dump -U devops_user devops_db > $BACKUP_DIR/$FILE_NAME

echo "Успішно! Бекап збережено: $BACKUP_DIR/$FILE_NAME"
