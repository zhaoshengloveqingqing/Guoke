# Clips Web, the prototype project for Clips Tool Web Development

## Introduction

This project is the prototype project for [Clips Tool](http://github.com/guitarpoet/clips-tool/).

This project is an ordinary web project based on PHP using framework Clips Tool. You can start coding your own just using [Composer](https://getcomposer.org)'s command:
	
	composer create-project guitarpoet/clips-web

The depenency management and autoloading support is done using [Composer](https://getcomposer.org) too.

This project need you to install these PHP plugins:

Required:

* [php-clips](http://github.com/guitarpoet/php-clips): The CLIPS port for PHP
* [php-sass](http://github.com/guitarpoet/php-sass): The sass compiler based on libsass

Optional:

 * [php-mmseg](http://github.com/guitarpoet/php-mmseg): The Chinese word tokenizer
 * [php-imagick](https://github.com/mkoppanen/imagick): The image processing framework for PHP, if you want to use widget like auto Figure or Picture, this is the recommended plugin
 * [php-gd](http://php.net/manual/en/ref.image.php): The image processing framework for PHP
 * php-posix: Needed for getting user or commandline's information(in command execution)
 * php-intl: The i18n plugin for PHP(for getting the locale for command line)

# Getting started

1. You can get the project just using this command (composer must be installed first).

	composer create-project -s dev guitarpoet/clips-web

2. Run the migration

	make migrate

3. Get the browser capacities database(this is used by the framework to match the user agent to detail browser information, to let framework and you to do the browser hack on purpose).

	./vendor/bin/clips get bcap

4. Fix the folder permission or ownership of folder application/cache. ** Note: This is very important since all the thing that needs cache(css, image, smarty compiled files) ** will be place here, if no write permission for your web application server(apache, for example), the web request will get failed

There you go.
