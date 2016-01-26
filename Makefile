DB := guoke

clean:
	sudo rm -rf application/cache/widget_*
	sudo rm -rf application/cache/img
	sudo rm -rf application/cache/css
test:
	@phpunit
migrate:
	@mysql -u root -e "drop database if exists ${DB}"
	@mysql -u root -e "create database ${DB}"
	@./vendor/bin/clips phinx migrate
c:
	@mysql -u root "${DB}"
fake:
	@./vendor/bin/clips data migrate
