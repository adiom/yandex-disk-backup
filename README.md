# yandex-disk-backup
### bash-скрипт для создания зашифрованной резервной копии на Яндекс Диск

## Подготовка




```bash
git clone https://github.com/adiom/yandex-disk-backup
cd yandex-disk-backup
```

Необходимо получить TOKEN для работы скрипта с вашим Диском
перейдите по [ссылке](https://oauth.yandex.ru/authorize?response_type=token&client_id=59ab22ca3f794a3b922935e2f8692985)
и разрешите доступ к вашим данным.
Скопируйте полученные данные в файл YANDEXDISK.TOKEN

пример
```bash
echo "xxxxxxxxxxxxx" > YANDEXDISK.TOKEN
```


Создайте на рабочем компьютере GPG ключ
>http://superuser.com/questions/1003403/how-to-use-gpg-gen-key-in-a-script

```bash
gpg --gen-key


gpg --keyserver hkp://pgp.mit.edu --send-keys 3A5C529C # отправьте публичный ключ на кейсервер

gpg --keyserver hkp://pgp.mit.edu --recv-keys EFEC3995 # получите публичный ключ 
gpg --edit-key support@canfly.org #разрешите trust key and save
```

Отредактируйте по необходимости скрипт

```bash
./diaspora-backup.sh
```
