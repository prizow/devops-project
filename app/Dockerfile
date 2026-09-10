# 1. Використовуємо офіційний базовий образ (slim версія для економії місця)
FROM python:3.11-slim

# Встановлюємо curl для нашого healthcheck
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# 2. Створюємо окремого користувача, щоб не сидіти під root
RUN useradd -m appuser

# Вказуємо робочу директорію
WORKDIR /app

# Копіюємо наш код всередину контейнера
COPY app.py .

# Віддаємо права на папку нашому новому користувачу
RUN chown -R appuser:appuser /app

# Перемикаємось на безпечного користувача (виконуємо вимогу "не від root")
USER appuser

# 3. Вказуємо необхідний порт
EXPOSE 3000

# 4. Додаємо Healthcheck (система кожні 30 секунд буде смикати наш сайт, перевіряючи, чи він живий)
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:3000/ || exit 1

# Команда для запуску нашого застосунку
CMD ["python", "app.py"]
