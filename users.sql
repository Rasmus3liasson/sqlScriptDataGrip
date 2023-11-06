SET GLOBAL validate_password_policy = 'STRONG';

CREATE USER 'developer'@'host' IDENTIFIED BY 'Lösenord_developer123';
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON bookstore.* TO 'developer'@'host';


CREATE USER 'webserver'@'host' IDENTIFIED BY 'Lösenord_web123';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore.* TO 'webserver'@'host';

SHOW GRANTS FOR 'developer'@'host';

