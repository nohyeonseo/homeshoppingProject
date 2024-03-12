select * from product;

INSERT INTO product VALUES(
'I0001', 
'아이브 IAM',
'ive IVE.png', 
'아이브의 정규1집앨범.총 11곡이 수록이 수록되었다',
'아이브의 첫 정규앨범 ive IVE은 완성형 걸그룹임을 증명합니다.밀리언 셀러를 기록한 After LIKE 이후 8개월 만의 발매로 자기애 자신감 자유 등의 키워드로 아이브의 정체성을 보여줍니다. 
흔들리지 않는 자기 확신과 뉴트로 코드 멜로디는 여전히 강력하며 아이브의 행보는 새로운 신드롬을예고합니다',
'여성그룹',
'25000',
'CD');

INSERT INTO product VALUES(
'a0001', 
'에스파 MY WORLD', 
'MY WORLD.png',
'에스파 3번째미니앨범. 총6곡이 수록되었다.',
'Girls 미니앨범 이후로 10개월 만에 새로운 앨범을 선보이는 에스파입니다.이번 앨범에는 광야에서 현실세계로 돌아온 에스파 멤버들의 세계관시즌2 이야기가 담겨있으며,총 6곡이 수록되었습니다.',
'여성그룹',
'17800',
'CD');

INSERT INTO product VALUES(
'n0001',
'뉴진스 getup',
'getup.png',
'뉴진스의 2집 앨범이다.NewJeans,SuperShy,ETA등 6곡이수록되어있다.',
'Get Up에서 뉴진스는 성장한 모습으로 여전히 매력을 발산하며 좋은 음악을 선보입니다.매일 찾게되고 언제 입어도 질리지않는 진처럼 시대의 아이콘이 되려는포부와 New Gens가 되겠다는 결심을 팀명에 담고 있습니다. Get Up은 이러한 포부와 각오가 담긴 뉴진스의 본질을 반영한 앨범입니다.',
'여성그룹',
'24000',
'CD');

DROP TABLE product;

CREATE TABLE product(
	p_id VARCHAR(10) NOT NULL,
	p_name VARCHAR(20),
	p_fileName VARCHAR(20),
	p_description VARCHAR(100),
	p_detail VARCHAR(500),
	p_category VARCHAR(20),
	p_unitPrice number,
	p_type VARCHAR(10),
	PRIMARY KEY (p_id)
);

ALTER TABLE product MODIFY p_detail VARCHAR(400);
ALTER TABLE product MODIFY p_name VARCHAR(40);
ALTER TABLE product MODIFY p_fileName VARCHAR(40);

INSERT INTO product VALUES('', ' ','', '','','',' ');


INSERT INTO product VALUES(
'R0001', 
'르세라핌 안티프레쟈',
'ANTIFRAGILE.png', 
'2022년 10월 17일에 발매된 르세라핌의 두 번째 미니 앨범이다.',
'르세라핌은 좌절할 생각이 전혀 없다. ANTIFRAGILE은 시련을 대하는 르세라핌의 당당한 태도를 이야기한다.',
'여성그룹',
'16000',
'CD');


DELETE FROM product
WHERE p_id = 'B0001';

INSERT INTO product VALUES(
'B0001',
'블랙핑크 DVD',
'brackpink.png',
'블랙핑크의 2번째 일본 콘서트 DVD.',
'블랙핑크의 일본 콘서트의 DVD입니다. 그 현장의 생동감을 확인해보세요.',
'여성그룹',
'64000',
'DVD');

INSERT INTO product VALUES(
'B0002',
'블랙핑크 DVD',
'brackpink.png',
'블랙핑크의 2번째 일본 콘서트 DVD.',
'블랙핑크의 일본 콘서트의 DVD입니다. 그 현장의 생동감을 확인해보세요.',
'여성그룹',
'64000',
'CD');






