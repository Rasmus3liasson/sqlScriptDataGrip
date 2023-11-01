SET GLOBAL validate_password_policy = 'STRONG';

CREATE USER 'utvecklare'@'host' IDENTIFIED BY 'Lösenord_utvecklare123';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER ON bookstore.* TO 'utvecklare'@'host';

CREATE USER 'webserver'@'host' IDENTIFIED BY 'Lösenord_web123';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore.* TO 'webserver'@'host';
