create table KHOAHOC (   MAKH                 char(4)              not null,
   TENKH                varchar(50)           not null,
   NGAYBD               date            not null,
   NGAYKT               date            not null ,
   constraint PK_KHOAHOC primary key  (MAKH),
   constraint CK_KHOAHOC  CHECK (NGAYKT>NGAYBD)
);


create table CHUONGTRINH (
   MACT                 char(5)              PRIMARY KEY,
   TENCT                varchar(100)          not null
);

create table LOAILOP (
   MALOAI               char(5)              not null  primary key,
   MACT                 char(5)              not null,
   TENLOAI              varchar(100)          not null,
   constraint FK_LOAILOP FOREIGN  key  (MACT) REFERENCES CHUONGTRINH(MACT)
);

create table LOP (
   MALOP                char(4)              not null PRIMARY KEY,
   MALOAI               char(5)              not null,
   TENLOP               varchar(50)          not null,
   SISO                 smallint             not null CHECK (SISO>12),
   MAKH   char(4)              not null,
   constraint FK1_LOP FOREIGN  key  (MALOAI) REFERENCES LOAILOP(MALOAI),
   constraint FK2_LOP FOREIGN  key  (MAKH) REFERENCES KHOAHOC(MAKH)
   
);

create table HOCVIEN (
   MAHV                 char(6)				primary key,
   TENHV                varchar(40)          not null,
   GIOITINH             smallint                  not null,
   NGAYSINH             date            not null,
   SDT                  char(10)                  not null,
   DIACHI               varchar(100)         not null
);

create table PHIEUTHU (
   SOPT                 CHAR(8)               PRIMARY KEY,
   MAHV                char(6)               not null,
   MALOP                char(4)              not null,
   NGAYLAPPHIEU         date	            not null,
   THANHTIEN        NUMERIC NOT NULL,
   constraint FK1_PT FOREIGN  key  (MAHV) REFERENCES HOCVIEN(MAHV),
   constraint FK2_PT FOREIGN  key  (MALOP) REFERENCES LOP(MALOP)
);

create table MONHOC (
   MAMH                 char(4)             PRIMARY KEY,
   TENMH                varchar(30)          not null
);



create table DIEM (
   MAMH                 char(4)              not null,
   MAHV                 char(6)                 not null,
   MALOP                char(4)              not null,
   DIEM                 float            not null CHECK(DIEM>=0),
   constraint PK_DIEM primary key  (MAMH, MAHV, MALOP),
    constraint FK1_DIEM FOREIGN  key  (MAHV) REFERENCES HOCVIEN(MAHV),
   constraint FK2_DIEM FOREIGN  key  (MALOP) REFERENCES LOP(MALOP),
   constraint FK3_DIEM FOREIGN  key  (MAMH) REFERENCES MONHOC(MAMH)
);


INSERT INTO KHOAHOC VALUES('K001','Khóa 1','2020-01-10','2020-03-20');
INSERT INTO KHOAHOC VALUES('K002','Khóa 2','2020-02-28','2020-05-28');
INSERT INTO KHOAHOC VALUES('K003','Khóa 3','2020-04-10','2020-07-20');
INSERT INTO KHOAHOC VALUES('K004','Khóa 4','2020-06-15','2020-09-20');


INSERT INTO CHUONGTRINH VALUES('CT001','Ti?ng Anh T?ng Quát');
INSERT INTO CHUONGTRINH VALUES('CT002','Ti?ng Anh Tr? Em');
INSERT INTO CHUONGTRINH VALUES('CT003','Ti?ng Anh Luy?n K? N?ng');
INSERT INTO CHUONGTRINH VALUES('CT004','Ch??ng Trình TOEIC');
INSERT INTO CHUONGTRINH VALUES('CT005','Ti?ng Anh IELTS');
INSERT INTO CHUONGTRINH VALUES('CT006','Ch??ng Trình CamBridge');
INSERT INTO CHUONGTRINH VALUES('CT007','Ch?ng Ch? Ti?ng Anh 6 B?c(A1,B1,B2,C1)');



INSERT INTO LOAILOP VALUES('LL001','CT001','Ti?ng Anh c?n b?n');
INSERT INTO LOAILOP VALUES('LL002','CT001','Ti?ng Anh A1');
INSERT INTO LOAILOP VALUES('LL003','CT001','Ti?ng Anh A2');
INSERT INTO LOAILOP VALUES('LL004','CT001','Ti?ng Anh B1');
INSERT INTO LOAILOP VALUES('LL005','CT001','Ti?ng Anh B2');
INSERT INTO LOAILOP VALUES('LL006','CT001','Ti?ng Anh C1');
INSERT INTO LOAILOP VALUES('LL007','CT001','Ti?ng Anh C2');
INSERT INTO LOAILOP VALUES('LL008','CT001','Ti?ng Anh nâng cao');
--
INSERT INTO LOAILOP VALUES('LL009','CT002','Anh v?n nhi ??ng');
INSERT INTO LOAILOP VALUES('LL010','CT002','Anh v?n thi?u nhi');
INSERT INTO LOAILOP VALUES('LL011','CT002','Anh v?n thi?u niên');
INSERT INTO LOAILOP VALUES('LL012','CT002','Ti?ng Anh t?ng quát dành cho thi?u niên(B1)');
INSERT INTO LOAILOP VALUES('LL013','CT002','Ti?ng Anh t?ng quát dành cho thi?u niên(B1+)');
INSERT INTO LOAILOP VALUES('LL014','CT002','Ti?ng Anh nâng cao');
INSERT INTO LOAILOP VALUES('LL015','CT002','IELTS');
--

INSERT INTO LOP VALUES ('L001','LL001','L?p 1','30','K001');
INSERT INTO LOP VALUES ('L002','LL001','L?p 2','30','K001');
INSERT INTO LOP VALUES ('L003','LL002','L?p 1','25','K001');





INSERT INTO HOCVIEN VALUES('HV0001','?? Bình An',1,'2000-11-02','0917217036','C? ?? - C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0002','?? Gia B?o',1,'2001-12-02','0917217036','Ôn Môn- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0003','?? Phúc Vinh',1,'2002-11-02','0917217036','Cù Lao Dung - Sóc Tr?ng');
INSERT INTO HOCVIEN VALUES('HV0004','Th?ch Chí Tâm',1,'2000-01-02','0917217036','Châu Thành- An Giang');


INSERT INTO HOCVIEN VALUES('HV0005','Lê C?m Giao','0',to_date('2000-11-05','yyyy-mm-dd'),'0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0006','Hu?nh Gia B?o','1',to_date('2000-11-02','yyyy-mm-dd'),'0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0007','?? An Nhiên','0',to_date('2001-01-02','yyyy-mm-dd'),'0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0008','Tr?n Hoàng Uyên Anh',0,'2002-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0009','Tr?n Thành',1,'1998-07-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0010','Tr?nh Giai Nhân',1,'2000-11-02','0917217036','Châu Thành- An Giang');
INSERT INTO HOCVIEN VALUES('HV0011','Lê Thanh Hoàng',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0014','Lê Thanh Tâm',1,'2002-01-17','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0015','Hu?nh Ng?c Minh',1,'2007-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0016','Ng? Hoàng Gia B?o',1,'2005-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0017','Tr?nh Ng?c Gia B?o',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0018','Bùi B?o Ng?c',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0019','Lê Ng?c Kim Khánh',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0020','Lê Hu?nh My',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0021','Tr?n Ng?c Tuy?t',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0022','Tr?n Ng?c Khánh Minh',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0023','Tr?n Ng?c Minh Anh',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0024','Tr?n Lê Kim Ngân',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0025','Lê Thanh Trân',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0026','Lê Thanh Tâm',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0027','Tr?n Ng?c Tuy?n',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0028','Tr?n Hu?nh Gia Nhi',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0029','Tr?n Lê Kim Thoa',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0030','Bùi M?ng C?m',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0031','Tr?n M?ng ?i?p',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0032','Tr?n Kim Quyên',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0033','Tr?n Lê Anh Th?',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0034','Tr?n Thanh Nghi',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0035','Tr?n Bùi T? Nga',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0036','Tr?n Th? Kim Cúc',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0037','Tr?n B?o Thy',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0038','Nguy?n Th? B?o Nghi',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0039','Lê Thanh Ng?c',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0040','Tr?n Th? Nh? Ý',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0041','Tr?n Ng?c M? Ý',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0042','Tr?n Ng?c Phúc An',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0043','Tr?n Ng?c Minh Anh',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0044','Tr?n Ng?c Phúc An',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0047','Tr?n Ng?c Bích',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0048','Tr?n Thanh Nhân',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0049','?? T? Uyên',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0050','Lê Hà My',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0051','Lê Ng?c Trân',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0052','Nguy?n Minh Thi',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0053','Tr?n Ng?c Anh',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0054','Tr?n Ng?c Khánh Nh?',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0055','Tr?n Ng?c Tiên',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0056','Tr?n Ki?u Tiên',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0057','Tr?n H?u Ph??c',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0058','Tr?n Hoàng Khang',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0059','Tr?n Lâm Tr??ng',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0060','Tr?n Tr?ng Phúc',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');

INSERT INTO HOCVIEN VALUES('HV0061','Tr?n Tr?ng Ngh?a',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0062','Tr?n Minh Nh?t',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0063','Lê Thanh An',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0064','Lê Kim Thy',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0065','Tr?n Huy?n Trang',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0066','Tr?n Minh Th?',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0067','Tr?n Thanh Ngân',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0068','Nguy?n Qu?c Ki?t',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0069','Lâm Th? Nh?',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0070','Lâm Minh Th?',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0071','?? Ng?c Nh?',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0072','Tr?n Tr?ng Phúc',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0073','Nguy?n Thanh Nh?',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0074','L? Huy?n Trang',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
--
INSERT INTO HOCVIEN VALUES('HV0075','L? Anh Th?',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0076','?? Hà My',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0077','?? Minh Khang',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0078','?? Hoàng Khang',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0079','?? Gia Khang',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0080','?? Bùi Minh Anh',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0081','Lê Tu?n Anh',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0082','?? Di?m Ly',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0083','?? T??ng Vy',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0084','?? Ng?c Chúc',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0085','?? Minh Nh?t',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0086','?? Minh Hoàng',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0087','?? Minh Trung',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0088','?? Minh Long',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0089','Võ V?n Khánh Qu?c',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0090','Nguy?n Trung H?u',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0091','?? Lam Nhã',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0092','Hu?nh Minh S?n',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0093','Hà Duy M?nh',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0094','L?u Hà Ph??c',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0095','?? Ng?c Ki?u Oanh',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0096','?? Gia Minh',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0097','?? Thanh Nhi',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0098','Lê T?n ??t',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0099','Lê Kim Ánh',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0100','?? Ph??ng Thùy',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0101','Lâm Th? Th?o Linh',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0102','?? Thanh Th?o',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0103','?? Ng?c Thùy',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0104','?? Ng?c Ph??ng',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0105','?? Th?ch Anh',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0106','L? T?n Anh',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0107','?? Hà Giang',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');

INSERT INTO HOCVIEN VALUES('HV0108','?? Tr??ng Giang',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0109','?? Hà My',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0110','?? Tu?n Phát',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0111','?? Tu?n Ki?t',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
---
INSERT INTO HOCVIEN VALUES('HV0112','?? Hà Huy',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0113','?? Hà Ng?c',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0114','?? Th? C?m Giang',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0115','Lê B?o Trang',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0116','Lê Ki?u My',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0117','Ph?m Thanh Trúc',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0118','Ph?m Ng?c Hà',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0119','Tr??ng Thanh Ng?c',0,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');
INSERT INTO HOCVIEN VALUES('HV0120','?? Ph?m Gia Huy',1,'2000-11-02','0917217036','Phong ?i?n- C?n Th?');










insert into PHIEUTHU values('PT000002','HV0002','L001','2021-06-01',1350000);
insert into PHIEUTHU values('PT000003','HV0003','L001','2021-06-01',1350000);
insert into PHIEUTHU values('PT000004','HV0004','L001','2021-06-01',1350000);
insert into PHIEUTHU values('PT000005','HV0005','L001','2021-06-01',1350000);
insert into PHIEUTHU values('PT000006','HV0006','L001','2021-06-01',1350000);
insert into PHIEUTHU values('PT000007','HV0007','L001','2021-06-01',1350000);
insert into PHIEUTHU values('PT000008','HV0008','L001','2021-06-01',1350000);
insert into PHIEUTHU values('PT000009','HV0009','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000010','HV0010','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000011','HV0011','L001','2021-06-02',1350000);
-- insert into PHIEUTHU values('PT000012','HV0012','L001','2021-06-02',1350000);
-- insert into PHIEUTHU values('PT000013','HV0013','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000014','HV0014','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000015','HV0015','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000016','HV0016','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000017','HV0017','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000018','HV0018','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000019','HV0019','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000020','HV0020','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000021','HV0021','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000022','HV0022','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000023','HV0023','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000024','HV0024','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000025','HV0025','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000026','HV0026','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000027','HV0027','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000028','HV0028','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000029','HV0029','L001','2021-06-02',1350000);
insert into PHIEUTHU values('PT000030','HV0030','L001','2021-06-02',1350000);

insert into PHIEUTHU values('PT000031','HV0031','L003','2021-06-02',1450000);
insert into PHIEUTHU values('PT000032','HV0032','L003','2021-06-02',1450000);
insert into PHIEUTHU values('PT000033','HV0033','L003','2021-06-02',1450000);
insert into PHIEUTHU values('PT000034','HV0034','L003','2021-06-02',1450000);
insert into PHIEUTHU values('PT000035','HV0035','L003','2021-06-02',1450000);
insert into PHIEUTHU values('PT000036','HV0036','L003','2021-06-02',1450000);
insert into PHIEUTHU values('PT000037','HV0037','L003','2021-06-02',1450000);
insert into PHIEUTHU values('PT000038','HV0038','L003','2021-06-02',1450000);
insert into PHIEUTHU values('PT000039','HV0039','L003','2021-06-02',1450000);
insert into PHIEUTHU values('PT000040','HV0040','L003','2021-06-02',1450000);
insert into PHIEUTHU values('PT000041','HV0041','L003','2021-06-02',1450000);
insert into PHIEUTHU values('PT000042','HV0042','L003','2021-06-02',1450000);
insert into PHIEUTHU values('PT000043','HV0043','L003','2021-06-02',1450000);
insert into PHIEUTHU values('PT000044','HV0108','L003','2021-06-05',1450000);
insert into PHIEUTHU values('PT000045','HV0109','L003','2021-06-05',1450000);
insert into PHIEUTHU values('PT000046','HV0110','L003','2021-06-05',1450000);
insert into PHIEUTHU values('PT000047','HV0111','L003','2021-06-05',1450000);
insert into PHIEUTHU values('PT000070','HV0044','L003','2021-06-05',1450000);





INSERT INTO MONHOC(MAMH,TENMH) VALUES ('MH01','Nghe');
INSERT INTO MONHOC(MAMH,TENMH) VALUES ('MH02','Nói');
INSERT INTO MONHOC(MAMH,TENMH) VALUES ('MH03','??c');
INSERT INTO MONHOC(MAMH,TENMH) VALUES ('MH04','Vi?t');


INSERT INTO DIEM values  ('MH01','HV0002', 'L001', 5.5);
INSERT INTO DIEM values  ('MH02','HV0002', 'L001', 6.5);
INSERT INTO DIEM values  ('MH03','HV0002', 'L001', 8.5);
INSERT INTO DIEM values  ('MH04','HV0002', 'L001', 3.5);

INSERT INTO DIEM values  ('MH01','HV0003', 'L001', 5.25);
INSERT INTO DIEM values  ('MH02','HV0003', 'L001', 6.8);
INSERT INTO DIEM values  ('MH03','HV0003', 'L001', 7.5);
INSERT INTO DIEM values  ('MH04','HV0003', 'L001', 5.5);

INSERT INTO DIEM values  ('MH01','HV0004', 'L001', 7.5);
INSERT INTO DIEM values  ('MH02','HV0004', 'L001', 6.5);
INSERT INTO DIEM values  ('MH03','HV0004', 'L001', 7.5);
INSERT INTO DIEM values  ('MH04','HV0004', 'L001', 5.0);

INSERT INTO DIEM values  ('MH01','HV0005', 'L001', 7.5);
INSERT INTO DIEM values  ('MH02','HV0005', 'L001', 8.0);
INSERT INTO DIEM values  ('MH03','HV0005', 'L001', 8.0);
INSERT INTO DIEM values  ('MH04','HV0005', 'L001', 7.75);

INSERT INTO DIEM values  ('MH01','HV0006', 'L001', 5.5);
INSERT INTO DIEM values  ('MH02','HV0006', 'L001', 6.5);
INSERT INTO DIEM values  ('MH03','HV0006', 'L001', 4.5);
INSERT INTO DIEM values  ('MH04','HV0006', 'L001', 3.5);

-- Cau 1: 
SELECT * FROM CHUONGTRINH;
SELECT * FROM DIEM;
SELECT * FROM HOCVIEN;
SELECT * FROM KHOAHOC;
SELECT * FROM LOAILOP;
SELECT * FROM LOP;
SELECT * FROM MONHOC;
SELECT * FROM PHIEUTHU;

-- Cau 2: 
SELECT * FROM HOCVIEN
WHERE GIOITINH = 1;

-- Cau 3:
SELECT * FROM HOCVIEN
WHERE DIACHI LIKE '%C?n Th?%';

-- Cau 4:
SELECT * FROM
  LOP INNER JOIN KHOAHOC ON LOP.MAKH = KHOAHOC.MAKH
WHERE TENKH = 'Khóa 1';

-- Cau 5: thuc hien noi ket tu nhien giua bon bang lan luot la: LOP + PHIEUTHU + HOCVIEN + KHOAHOC
SELECT HOCVIEN.MAHV, HOCVIEN.TENHV
FROM
  ((PHIEUTHU INNER JOIN LOP ON PHIEUTHU.MALOP = LOP.MALOP) --  lay ra lop thuoc khoa 1
  INNER JOIN HOCVIEN ON HOCVIEN.MAHV = PHIEUTHU.MAHV) -- lay ra cac hoc vien trong cac lop thuoc khoa 1
  INNER JOIN KHOAHOC ON LOP.MAKH = KHOAHOC.MAKH
WHERE TENKH = 'Khóa 1';

-- Cau 6: 
SELECT * FROM HOCVIEN
WHERE TENHV LIKE '%??%';  

-- Cau 7:
SELECT * FROM HOCVIEN
WHERE NGAYSINH >= '2000-1-1' AND NGAYSINH <= '2000-12-31';

-- Cau 8:
SELECT * FROM HOCVIEN
WHERE NGAYSINH >= '2001-12-1' AND NGAYSINH <= '2001-12-31';

-- Cau 9:
SELECT * FROM HOCVIEN
WHERE NGAYSINH >= '1998-1-1' AND NGAYSINH <= '2000-12-31';

-- Cau 10:
SELECT * FROM PHIEUTHU
WHERE NGAYLAPPHIEU >= '2021-6-5' AND NGAYLAPPHIEU <= '2021-6-10'; 

-- Cau 11:
SELECT HOCVIEN.* FROM 
  ((PHIEUTHU INNER JOIN LOP ON PHIEUTHU.MALOP = LOP.MALOP) -- lay ra nhung phieu thu thuoc "lop 1"
  INNER JOIN LOAILOP ON LOP.MALOAI = LOAILOP.MALOAI) -- lay ra nhung "lop 1" thuoc TACB
  INNER JOIN HOCVIEN ON HOCVIEN.MAHV = PHIEUTHU.MAHV -- lay ra thong tin sinh vien
WHERE LOP.MALOP = 'L001' AND LOAILOP.TENLOAI = 'Ti?ng Anh c?n b?n';

-- Cau 12:
SELECT LOAILOP.* FROM
  (CHUONGTRINH INNER JOIN LOAILOP ON CHUONGTRINH.MACT = LOAILOP.MACT) -- lay ra cac loai lop thuoc chuong trinh TATQ
  INNER JOIN LOP ON LOAILOP.MALOAI = LOP.MALOAI -- tim ra nhung lop thuoc loai TATQ
WHERE CHUONGTRINH.TENCT = 'Ti?ng Anh T?ng Quát';

-- Cau 13: 
SELECT PHIEUTHU.* FROM
  ((PHIEUTHU INNER JOIN LOP ON PHIEUTHU.MALOP = LOP.MALOP) -- lay ra nhung phieu thu thuoc lop 1
  INNER JOIN LOAILOP ON LOP.MALOAI = LOAILOP.MALOAI) -- lay ra nhung phieu thu thuoc lop 1 thuoc TAA1
WHERE LOP.TENLOP = 'L?p 1' AND LOAILOP.TENLOAI = 'Ti?ng Anh A1';

-- Cau 14:
SELECT HOCVIEN.TENHV, MONHOC.TENMH, DIEM.DIEM FROM
  ((((PHIEUTHU INNER JOIN LOP ON PHIEUTHU.MALOP = LOP.MALOP) -- lay ra phieu thu thuoc khoa 1
  INNER JOIN HOCVIEN ON PHIEUTHU.MAHV = HOCVIEN.MAHV) -- lay ra cac hoc vien thuoc khoa 1
  INNER JOIN DIEM ON DIEM.MAHV = HOCVIEN.MAHV AND LOP.MALOP = LOP.MALOP) -- lay ra diem cua cac hoc vien thuoc khoa 1
  INNER JOIN MONHOC ON MONHOC.MAMH = DIEM.MAMH) -- lay ra ten mon hoc
  INNER JOIN KHOAHOC ON LOP.MAKH = KHOAHOC.MAKH
WHERE TENKH = 'Khóa 1'
ORDER BY HOCVIEN.MAHV;

-- Cau 15:
SELECT COUNT(*) SOLUONGHOCVIEN FROM HOCVIEN;

-- Cau 16:
SELECT COUNT(*) SOLUONGHOCVIEN FROM
  (PHIEUTHU INNER JOIN LOP ON PHIEUTHU.MALOP = LOP.MALOP) -- lay ra cac "lop 1"
  INNER JOIN LOAILOP ON LOAILOP.MALOAI = LOP.MALOAI -- lay ra cac "lop 1" thuoc loai TACB
WHERE TENLOP = 'L?p 1' AND LOAILOP.TENLOAI = 'Ti?ng Anh c?n b?n';

-- Cau 17:
SELECT SUM(THANHTIEN) TONGSOTIEN FROM
  (PHIEUTHU INNER JOIN LOP ON PHIEUTHU.MALOP = LOP.MALOP) -- lay cac phieu thu thuoc "lop 2"
  INNER JOIN LOAILOP ON LOAILOP.MALOAI = LOP.MALOAI -- lay ra cac "lop 2" thuoc loai TACB
WHERE TENLOP = 'L?p 2' AND LOAILOP.TENLOAI = 'Ti?ng Anh c?n b?n'; 

-- Cau 18:
SELECT SUM(THANHTIEN) TONGSOTIEN FROM
  (PHIEUTHU INNER JOIN LOP ON PHIEUTHU.MALOP = LOP.MALOP) -- lay ra cac lop thuoc khoa 1
  INNER JOIN KHOAHOC ON LOP.MAKH = KHOAHOC.MAKH
WHERE TENKH = 'Khóa 1';

-- Cau 19:
SELECT AVG(DIEM) DIEMTRUNGBINH FROM
  (((PHIEUTHU INNER JOIN LOP ON PHIEUTHU.MALOP = LOP.MALOP) -- lay ra cac "lop 1"
  INNER JOIN LOAILOP ON LOAILOP.MALOAI = LOP.MALOAI)-- lay ra cac "lop 1" thuoc loai TACB
  INNER JOIN DIEM ON DIEM.MAHV = PHIEUTHU.MAHV AND DIEM.MALOP = PHIEUTHU.MALOP) -- lay ra bang diem cua cac hoc vien thuoc lop 1 loai TACB
  INNER JOIN HOCVIEN ON HOCVIEN.MAHV = PHIEUTHU.MAHV -- lay ra diem cua hoc vien Gia Bao
WHERE TENLOP = 'L?p 1' AND LOAILOP.TENLOAI = 'Ti?ng Anh c?n b?n' AND HOCVIEN.TENHV = '?? Gia B?o' AND HOCVIEN.NGAYSINH = '2001-12-2'
;

-- Cau 20:
SELECT MAX(DIEM) DIEMLONNHAT FROM DIEM;



