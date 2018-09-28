# Bugtracker

Start with the following commands

```sh

    # set database initial user (administrator)
    make start
    $ firefox http://localhost:8012/admin/install.php

```

Fill out the mantisbt initial form
>>> username: administrator
>>> password: root
==================================================================================
Installation Options
==================================================================================
Type of Database                                        MySQL/MySQLi
Hostname (for Database Server)                          mysql_mantisbt
Username (for Database)                                 administrator
Password (for Database)                                 root
Database name (for Database)                            bugtracker
Admin Username (to create Database if required)         administrator
Admin Password (to create Database if required)         root
Print SQL Queries instead of Writing to the Database    [ ]
Attempt Installation                                    [Install/Upgrade Database]
==================================================================================

## email

Append following to /var/www/html/config_inc.php

$g_phpMailer_method = PHPMAILER_METHOD_SMTP;
$g_administrator_email = 'admin@example.org';
$g_webmaster_email = 'webmaster@example.org';
$g_return_path_email = 'mantisbt@example.org';
$g_from_email = 'mantisbt@example.org';
$g_smtp_host = 'smtp.example.org';
$g_smtp_port = 25;
$g_smtp_connection_mode = 'tls';
$g_smtp_username = 'mantisbt';
$g_smtp_password = '********';