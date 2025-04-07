Деплой приложения на реальный ubuntu сервер с использованием GITLAB

// Подключение на подготовленный сервер VPS
ssh -i C:/SWEB/id_rsa root@89.111.141.9
// Завершение подключения
exit

На сервере:
apt update && apt install -y docker.io docker-compose

В GitHub репозитории:
Settings > Secrets and variables > Actions > New repository secret
Добавить переменные
SSH_PRIVATE_KEY
SERVER_HOST


//Убираем конфигурационный файлик по умолчанию Nginx
//Сделаем симулинк к нашим настройкам
//Теперь сделаем из него симулинк в enabled
//Конфигурацию подложили в каталог настроек Nginx, она должна сработать
//Проверим что nginx не видит в конфигурации ошибку, и синтаксис корректен
sudo rm /etc/nginx/sites-enabled/default

sudo ln -s /opt/django_app/conf/myapp.nginx /etc/nginx/sites-available/

sudo ln -s /etc/nginx/sites-available/myapp.nginx /etc/nginx/sites-enabled/

cat /etc/nginx/sites-enabled/myapp.nginx

sudo nginx -t










Если мы хотим собирать докер образ и деплоить на сервер с помощью GitHub Actions,
можем самостоятельно повыбирать и шаблонов во вкладке Actions




Чтобы подключаться в ssh в каталоге пользователя на сервере прописаны ключи доступа

/.ssh/authorized_keys

ssh keygen выполняется на своём компьютере локально и создаёт два файла - с публичным ключом и приватным ключом
Приватный никому нельзя показывать.
Публичный можно передать на удалённую систему чтобы она нас опознала по приватному ключу












