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
