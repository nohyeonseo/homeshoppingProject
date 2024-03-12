create table member ( 
    id varchar(10) not null,
    password varchar(15) not null,
    name varchar(10) not null,
    mail  varchar(30),
    phone varchar(20),
    address varchar(90),
    primary key(id) 
) ;

select * from member;

INSERT INTO member (id, password, name, mail, phone, address)
VALUES ('operation', '1102', '관리자', 'nohyeonseo1102@gmail.com', '010-6207-0349', '김해시');

UPDATE member
SET id = 'operator'
WHERE id = 'operation';