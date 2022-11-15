CREATE USER buoi5 IDENTIFIED BY "buoi5";
GRANT ALL PRIVILEGES TO buoi5;

CREATE TABLE khuvuc(
	IP varchar(20) NOT NULL PRIMARY KEY,
	tenKhuvuc varchar(30) not null,
	tang smallint);
----------------------------------------------------
CREATE TABLE phong(
	MP varchar(20) NOT NULL PRIMARY KEy,
	tenphong varchar(20) not null,
	somay smallint,
	IP varchar(20),
	foreign key(IP) references khuvuc(IP));
----------------------------------------------------
create table loai(
	idloai varchar(20) not null primary key,
	tenloai varchar(30) not null);
----------------------------------------------------
create table may(
	idMay varchar(20) not null primary key,
	tenmay varchar(20) not null,
	IP varchar(20),
	ad smallint check (ad BETWEEN 0 and 255),
	idloai varchar(20),
	MP varchar(20),
	foreign key(IP) references khuvuc(IP),
	foreign key(idloai) references loai(idloai));
----------------------------------------------------
create table phanmem(
	idPM varchar(20) not null primary key,
	tenPM varchar(30) not null,
	ngaymua date,
	version varchar(20),
	idloai varchar(20),
	gia smallint check(gia>=0),
	foreign key(idloai) references loai(idloai));
----------------------------------------------------
create table caidat(
	id varchar(20) not null primary key,
	idMay varchar(20),
	idPM varchar(20),
	ngaycai date default SYSDATE,
	foreign key(idMay) references may(idMay),
	foreign key(idPM) references phanmem(idPM));
	
----------------------------------------------------

insert into khuvuc values('130.120.80','Brin RDC',null);
insert into khuvuc values('130.120.81','Brin tang 1',null);
insert into khuvuc values('130.120.82','Brin tang 2',null);

----------------------------------------------------

insert into phong values('s01','salle 1',3,'130.120.80');
insert into phong values('s02','salle 2',2,'130.120.80');
insert into phong values('s03','salle 3',2,'130.120.80');
insert into phong values('s11','salle 11',2,'130.120.81');
insert into phong values('s12','salle 12',1,'130.120.81');
insert into phong values('s21','salle 21',2,'130.120.82');


--select * from khuvuc;
--select * from phong;
----------------------------------------------------

insert into loai values('TX','Terminal X-Window');
insert into loai values('UNIX','System Unix');
insert into loai values('PCNT','PC Windows NT');
insert into loai values('PCWS','PC Windows');
insert into loai values('NC','Network Computer');

-----------------------------------------------------
insert into may values('p1','Poste 1','130.120.80',01,'TX','s01');
insert into may values('p2','Poste 2','130.120.80',02,'UNIX','s01');
insert into may values('p3','Poste 3','130.120.80',03,'TX','s01');
insert into may values('p4','Poste 4','130.120.80',04,'PCWS','s02');
insert into may values('p5','Poste 5','130.120.80',05,'PCWS','s02');
insert into may values('p6','Poste 6','130.120.80',06,'UNIX','s03');
insert into may values('p7','Poste 7','130.120.80',07,'TX','s03');
insert into may values('p8','Poste 8','130.120.81',01,'UNIX','s11');
insert into may values('p9','Poste 9','130.120.81',02,'TX','s11');
insert into may values('p10','Poste 10','130.120.81',03,'UNIX','s12');
insert into may values('p11','Poste 11','130.120.82',01,'PCNT','s21');
insert into may values('p12','Poste 12','130.120.82',02,'PCWS','s21');
-----------------------------------------------------
insert into phanmem values('log1','Oracle 6','05-13-1995','6.2','UNIX',3000);
insert into phanmem values('log2','Oracle 8','09-15-1999','8i','UNIX',5600);
insert into phanmem values('log3','SQL Server','04-12-1998','7','PCNT',2700);
insert into phanmem values('log4','Front Page','06-03-1997','5','PCWS',500);
insert into phanmem values('log5','WinDev','05-12-1997','5','PCWS',750);
insert into phanmem values('log6','SQL*Net',null,'2.0','UNIX',500);
insert into phanmem values('log7','I.I.S.','04-12-2002','2','PCNT',810);

--SELECT * FROM PHANMEM;
-----------------------------------------------------
insert into caidat(idMay,idPM,id,ngaycai) values('p1','log1','13','08-10-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p1','log2','14','08-11-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p2','log1','1','05-15-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p2','log2','2','09-17-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p4','log5','3',null);
insert into caidat(idMay,idPM,id,ngaycai) values('p6','log6','4','05-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p6','log1','5','05-2-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p8','log2','6','05-19-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p8','log6','7','05-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p8','log1','12','06-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p11','log3','8','04-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p12','log4','9','04-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p11','log7','10','04-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p7','log7','11','04-01-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p12','log6','15','07-25-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p12','log1','16','03-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p3','log1','17','03-20-2003');

SELECT * FROM CAIDAT;
SELECT * FROM KHUVUC;
SELECT * FROM LOAI;
SELECT * FROM MAY;
SELECT * FROM PHANMEM;
SELECT * FROM PHONG;

-- Cau 1:

-- Cau 2:
SELECT LOAI.TENLOAI FROM
MAY INNER JOIN LOAI ON MAY.IDLOAI = LOAI.IDLOAI
WHERE MAY.IDMAY = 'p8';

-- Cau 3:
SELECT TENPM FROM PHANMEM
WHERE IDLOAI = 'UNIX';

-- Cau 4:
SELECT PHONG.MP, PHONG.TENPHONG, PHONG.IP FROM
MAY INNER JOIN PHONG ON MAY.MP = PHONG.MP
WHERE MAY.IDLOAI = 'UNIX' OR MAY.IDLOAI = 'PCWS';

-- Cau 5:
SELECT PHONG.MP, PHONG.TENPHONG, PHONG.IP FROM
MAY INNER JOIN PHONG ON MAY.MP = PHONG.MP
WHERE (MAY.IDLOAI = 'UNIX' OR MAY.IDLOAI = 'PCWS') AND PHONG.IP = '130.120.80';

-- Cau 6:
SELECT COUNT(*) SO_LUONG_PHAN_MEM FROM CAIDAT
WHERE IDMAY = 'p6';

-- Cau 7:
SELECT COUNT(*) SO_LUONG_MAY FROM CAIDAT
WHERE IDPM = 'log1';

-- Cau 8:
SELECT TENMAY, CONCAT(IP, CONCAT('.', AD)) IP_DAY_DU FROM MAY
WHERE IDLOAI = 'TX';

-- Cau 9:
select IDMAY, COUNT(IDMAY) SO_LUONG_PHAN_MEM FROM CAIDAT
GROUP BY IDMAY;

-- Cau 10:
SELECT TENPHONG, SOMAY FROM PHONG;

-- Cau 11:
SELECT IDPM, COUNT(IDPM) SO_LAN_CAI FROM CAIDAT
GROUP BY IDPM;

-- Cau 12:
select AVG(GIA) GIA_TRUNG_BINH FROM PHANMEM
WHERE IDLOAI = 'UNIX';

-- Cau 13:
SELECT MAX(NGAYMUA) NGAY_MUA_PHAN_MEM_GAN_NHAT FROM PHANMEM;

-- Cau 14:
SELECT COUNT(*) FROM
    (SELECT IDMAY, COUNT(IDMAY) FROM CAIDAT
    GROUP BY IDMAY
    HAVING COUNT(IDMAY) > 1)
;

-- Cau 15:
SELECT IDLOAI FROM PHANMEM
MINUS
SELECT IDLOAI FROM MAY;

-- Cau 16:
SELECT IDLOAI FROM PHANMEM
INTERSECT
SELECT IDLOAI FROM MAY;

-- Cau 17:
SELECT IDLOAI FROM MAY
MINUS
SELECT IDLOAI FROM PHANMEM;

-- Cau 18:
SELECT MAY.IDMAY, CONCAT(MAY.IP, CONCAT('.', MAY.AD)) IP_DAY_DU FROM
CAIDAT INNER JOIN MAY ON CAIDAT.IDMAY = MAY.IDMAY
WHERE CAIDAT.IDPM = 'log6';

-- Cau 19:
SELECT MAY.IDMAY, CONCAT(MAY.IP, CONCAT('.', MAY.AD)) IP_DAY_DU FROM
(CAIDAT INNER JOIN MAY ON CAIDAT.IDMAY = MAY.IDMAY)
INNER JOIN PHANMEM ON PHANMEM.IDPM = CAIDAT.IDPM
WHERE PHANMEM.TENPM = 'Oracle 8';

-- Cau 20:
SELECT KHUVUC.TENKHUVUC FROM KHUVUC INNER JOIN
    (SELECT IP, COUNT(IP) FROM MAY
    WHERE IDLOAI = 'TX'
    GROUP BY IP
    HAVING COUNT(IP) = 3) TEMP 
ON KHUVUC.IP = TEMP.IP;

-- Cau 21:
SELECT DISTINCT PHONG.TENPHONG FROM
((CAIDAT INNER JOIN PHANMEM ON CAIDAT.IDPM = PHANMEM.IDPM)
INNER JOIN MAY ON CAIDAT.IDMAY = MAY.IDMAY)
INNER JOIN PHONG ON PHONG.MP = MAY.MP
WHERE PHANMEM.TENPM = 'Oracle 6';

-- Cau 22:
SELECT TENPM FROM PHANMEM
WHERE NGAYMUA = (SELECT MAX(NGAYMUA) NGAY_MUA_PHAN_MEM_GAN_NHAT FROM PHANMEM);

-- Cau 23:
SELECT TENPM FROM PHANMEM
WHERE GIA > (SELECT MIN(GIA) FROM PHANMEM WHERE IDLOAI = 'UNIX') AND IDLOAI = 'PCNT';

-- Cau 24:
SELECT TENPM FROM PHANMEM
WHERE GIA > (SELECT MAX(GIA) FROM PHANMEM WHERE IDLOAI = 'PCNT') AND IDLOAI = 'UNIX';

-- Cau 25:
SELECT * FROM CAIDAT INNER JOIN PHANMEM ON CAIDAT.IDPM = PHANMEM.IDPM
WHERE IDMAY <> 'p6';
SELECT * FROM CAIDAT INNER JOIN PHANMEM ON CAIDAT.IDPM = PHANMEM.IDPM
where IDMAY = 'p6';
