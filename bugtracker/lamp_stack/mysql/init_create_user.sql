CREATE DATABASE /*!32312 IF NOT EXISTS*/`bugtracker` /*!40100 DEFAULT CHARACTER SET latin1 */;
CREATE USER 'administrator'@'php_mantisbt' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON bugtracker.* TO 'administrator'@'php_mantisbt';
FLUSH PRIVILEGES;
/* Todo: Add administrator user for php_myadmin container */
/* Add for every other host that should connect */

