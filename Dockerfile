# В начале указываем на базе какого образа этот
FROM python:3.11-alpine

#Подгатавливаем каталог с коталогом приожения
#как рабочий каталог
WORKDIR /app

#Копируем текущее приложение
#Конкретно копируем именно папку django_project
#Точка в конце обозначает текущий каталог в Docker Образе
COPY ./django_project .
#Похоже что в контейнере лучше оставить структуру папок по умолчанию. Хранить проект django_project в папке django_project
#COPY ./manage.py .

#Помимо прилозения нам понадобится файлик
COPY ./requirements.txt .


#Файл нужный для применения миграций
COPY ./run.sh .

#Можно прописать команду RUN
RUN pip install -r requirements.txt

# Из-за особенности буферизованного ввода/вывода чтобы видеть информацию сразу, а не в отложенном виде \
# Монжо добавить переменную при инициализации контейнера
ENV PYTHONUNBUFFERED=1


#Применение миграций
#Через оболочку sh вызываем скрипт
CMD ["sh", "run.sh"]


# CMD и ENTRYPOINT несильно отличаются
#Указываем просто команду как в обычном терминале, но не как строчку с пробелами
#Строки будут собраны через пробел в команду
#runserver в конце - не достаточно
#0.0.0.0:0000 нужен для доступа извне контейнера - Django будет отвечать на запросы с любого сетевого интерфейса

#run.sh содержит код для мигарций и создания суперпользователя, поэтому используем её
#код ниже работает при БД SQLite
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]









