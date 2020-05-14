# mikronavt_infra
mikronavt Infra repository

# Домашнее задание №3

### Подключение к someinternalhost напрямую:

1)Добавляем приватный ключ:
	ssh-add key1

2) Для входа выполняем команду:
	ssh -J  tol@35.233.103.154 tol@10.132.0.3

### Подключение с помощью одной команды <i>ssh someinternalhost</i>:

Прописать в ~/.ssh/config:

	Host bastion
    	HostName 35.233.103.154
    	User tol

	Host someinternalhost
		Hostname 10.132.0.3
		User tol
		ProxyJump bastion

### Данные для подключения:

	bastion_IP = 35.233.103.154
	someinternalhost_IP = 10.132.0.3

# Домашнее задание №4

### Даннные для подключения
	testapp_IP = 104.155.97.42
	testapp_port = 9292

### Создание инстанса в GCP с последующим запуском скрипта установок:

	gcloud compute instances create reddit-app\
		--boot-disk-size=10GB \
  		--image-family ubuntu-1604-lts \
  		--image-project=ubuntu-os-cloud \
  		--machine-type=g1-small \
  		--tags puma-server \
  		--restart-on-failure \
  		--metadata-from-file startup-script=startup_script.sh

### Создание правила для фаервола:

	./bin/gcloud compute firewall-rules create default-puma-server1 \
		--allow=tcp:9292 \
		--source-ranges="0.0.0.0/0" \
		--target-tags="puma-server"

# Домашнее задание №5

### В ДЗ сделано:

Параметризованный шаблон Packer для создания образа с предустановленными Ruby и Mongodb:
	/packer/ubuntu16.

Файл с пользовательскими параметрами:
	/packer/variables.json.example

Для создания образа использовать команду (из директории packer):
	packer build -var-file=variables.json ubuntu16.json

Шаблон packer для создания образа с предустановленным приложением:
	/packer/immutable.json

Для создания образа использовать команду (из директории packer):
	packer build -var-file=variables.json immutable.json

Для создания ВМ из образа использовать скрипт:
	./config-scripts/create-reddit-vm.sh

# Домашнее задание №6

###  Задание со *. Возникшие проблемы:

	Если добаить в метаданные проекта в GCP публичный ключ для пользователя appuser_web (его создавал отдельно от основного ключа для appuser), ничего не добавляя в метаданные terraform в main.tf и потом попробовать сделать terraform apply, то никакиех изменений внесено не будет. Но при этом после добавления ключа появляется возможность подключаться к образу под пользователем appuser_web.

	Если же после добавления ключа в в метаданные проекта в GCP добавить его еще и в main.tf, то terraform apply сработает и конфликтов не будет.
