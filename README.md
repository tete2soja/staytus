# Staytus

![GitHub](https://img.shields.io/github/license/tete2soja/staytus?style=flat-square)

_Note: This project is a fork from the orignal work of adamcooke. This fork exists to apply some PR and fixes issues from the original one. I want to add some other features._

Staytus is a complete solution for publishing the latest information about
any issues with your web applications, networks or services. Along with
absolutely beautiful public & admin interfaces, Staytus is a powerful tool for
any organization with customers that rely on them to be online 24/7.

* [Read the roadmap](https://github.com/tete2soja/staytus/blob/master/ROADMAP.md)
* [Report a bug](https://github.com/tete2soja/staytus/issues/new?labels=bug)
* [Ask a question](https://github.com/tete2soja/staytus/issues/new?labels=question)
* [Installation tutorial](https://atech.blog/atech/install-staytus-tutorial)

![Screenshot](https://cdn.atech.blog/attachment/2cbe07f3-3ea9-4297-8196-e5d93aa2fbb1/3rLyUWsG.png)

## Installation from source

### System Requirements

* Ruby 2.3 or greater (including `ruby-dev` package on Linux)
* MySQL database server
* Ruby gems:
  * Bundler (`gem install bundler`)
  * Rake (`gem install rake`)
  * Procodile (`gem install procodile`)

### Installation Instructions

Alternatively, these basic instructions will get you up and running.

Before start, you'll need to create a new MySQL database:

```sql
CREATE DATABASE `staytus` CHARSET utf8 COLLATE utf8_unicode_ci;
GRANT ALL ON staytus.* TO `staytus`@`localhost` IDENTIFIED BY "a_secure_password";
```

```bash
$ git clone https://github.com/tete2soja/staytus
$ cd staytus
$ git checkout stable
$ bundle install --deployment --without development:test
$ cp config/database.example.yml config/database.yml
$ vim config/database.yml # Add your database configuration
$ bundle exec rake staytus:build staytus:install
$ procodile start --foreground
```

In case the `bundle install` command fails at `mysql2`, make sure that you have the MySQL development package (ie. `mysql` on macOS, `libmariadb-dev` for MariaDB on Linux)

This will run the application on HTTP port 8787 and you can access from `http://[IP]:8787` to begin the installation.

You may also want to change the SMTP configuration via environment variables,
which are described in [`config/environment.example.yml`](config/environment.example.yml).

To run staytus in the background, simply run `procodile start` without the `--foreground` option.

### Upgrading

Once you've installed Staytus, you can easily upgrade it by following this process.

```bash
$ cd path/to/staytus
$ git pull origin stable
$ bundle
$ bundle exec rake staytus:build staytus:upgrade
```

Once you've done this, you should ensure you restart any Staytus processes which you have running.

## E-Mail Notifications

All e-mail notifications are sent through a background worker process. This will be started automatically when you run the application using `procodile start`. If you don't do this, you can run jobs using `bundle exec rake jobs:work`.

## Administration

To log in for the first time, visit the `/admin`, and log in with email `admin@example.com` and password `password`. You will probably want to go to `Settings` -> `Users` and set up your admins. The default user should be deleted once you have create a new one with your own email address and password.

## Themes

All themes are stored in the `content/themes` directory. You can add your own themes in this directory but we do not recommend making changes to the `default` theme as these changes may get overridden in an upgrade.

Each time you edit the theme, you need to compile again all static assets using ` bundle exec rake staytus:build staytus:install`.

## Examples in the wild

* [Krystal Network](https://krystalstatus.uk/)
* [Dial 9 Status Site](https://status.dial9.co.uk/)

If you're running Staytus in the wild, let us know so we can
add you to the list.