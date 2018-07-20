help: 
	@echo "Author - Olaolu Akinsete"
	@echo

clean-start:
	@echo "remove data and log"
	sudo rm -rf data
	sudo rm -rf logs
	@echo
	@echo "stop and remove running containers"
	docker stop mysql_mantisbt
	docker stop php_mantisbt
	docker stop phpmyadmin_mantisbt
	docker rm mysql_mantisbt
	docker rm php_mantisbt
	docker rm phpmyadmin_mantisbt
	@echo
	@echo "run application"
	docker-compose build
	docker-compose up -d
	@echo
	@echo "logging into mysql"
	docker exec -it mysql_mantisbt mysql -u root -p
	SELECT User, Host FROM mysql;
