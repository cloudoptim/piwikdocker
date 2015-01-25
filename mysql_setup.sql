SET PASSWORD FOR 'root'@'localhost'=PASSWORD('cisco123');

CREATE DATABASE piwik;

GRANT ALL PRIVILEGES ON piwik.* TO 'piwik'@'localhost' IDENTIFIED BY 'cisco123';


