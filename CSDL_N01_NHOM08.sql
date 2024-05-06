CREATE database cinema;
use cinema;

CREATE TABLE NHANVIEN
(
  MaNV VARCHAR(10) NOT NULL,
  sdt CHAR(10) ,
  HoTen NVARCHAR(100) NOT NULL,
  ChucVu CHAR(100),
  PRIMARY KEY (MaNV)
);

CREATE TABLE PHIM
(
  TenPhim NVARCHAR(100) NOT NULL,
  Maphim VARCHAR(20) NOT NULL,
  TheLoai VARCHAR(100),
  GioiHanDoTuoi INT,
  ThoiLuong INT,
  QuocGia NVARCHAR(50),
  DaoDien NVARCHAR(50),
  Rated VARCHAR(5),
  DvChinh NVARCHAR(100) ,
  DinhDang VARCHAR(20),
  Mota NVARCHAR(1000),
  PRIMARY KEY (Maphim)
);

CREATE TABLE PHONGCHIEU
(
  MaPhong CHAR(3) NOT NULL,
  TenPhongChieu VARCHAR(20) NOT NULL,
  PRIMARY KEY (MaPhong)
);

CREATE TABLE KHACHHANG
(
  MaKH VARCHAR(10) NOT NULL,
  TenKH NVARCHAR(50) NOT NULL,
  email VARCHAR(100) ,
  sdt CHAR(10) ,
  MatKhau VARCHAR(50) ,
  PRIMARY KEY (MaKH)
);

CREATE TABLE GHE
(
  MaGhe CHAR(6) NOT NULL,
  TenGhe CHAR(3) NOT NULL,
  MaPhong CHAR(3) NOT NULL,
  PRIMARY KEY (MaGhe),
  FOREIGN KEY (MaPhong) REFERENCES PHONGCHIEU(MaPhong)
);

CREATE TABLE SUATCHIEU
(
  MaSuatchieu VARCHAR(20) NOT NULL,
  NgayChieu DATE,
  GioChieu TIME,
  MaNV VARCHAR(10) NOT NULL,
  Maphim VARCHAR(20) NOT NULL,
  MaPhong CHAR(3) NOT NULL,
  PRIMARY KEY (MaSuatchieu),
  FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV),
  FOREIGN KEY (Maphim) REFERENCES PHIM(Maphim),
  FOREIGN KEY (MaPhong) REFERENCES PHONGCHIEU(MaPhong)
);

CREATE TABLE VEXEMPHIM 
(
  NgaySuatVe  DATE,
  MaVe VARCHAR(20) NOT NULL,
  GiaVe INT,
  GioSuatVe TIME,
  MaNV VARCHAR(10) NOT NULL,
  MaSuatchieu VARCHAR(20) NOT NULL,
  MaKH VARCHAR(10) NOT NULL,
  MaGhe CHAR(6) NOT NULL,
  PRIMARY KEY (MaVe),
  FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV),
  FOREIGN KEY (MaSuatchieu) REFERENCES SUATCHIEU(MaSuatchieu),
  FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH),
  FOREIGN KEY (MaGhe) REFERENCES GHE(MaGhe)
);

INSERT INTO NHANVIEN (MaNV, sdt, ChucVu, HoTen)
VALUES
(215893,	0367123567,	'staff',	N'Nguyễn Quanh Minh'),
(215239,	0901523463,	'staff',	N'Nguyễn Trung Trúc'),
(215246,	0377235765,	'staff',	N'Trần Hoàng Phúc'),
(201478,	0883236552,	'senior',	N'Lê Thanh Liêm'),
(216233,	0988677568,	'staff',	N'Vũ Thu Thủy'),
(195563,	0904523654,	'manager',	N'Phan Thúy Hiền'),
(216241,	0953643242,	'staff',	N'Phạm Đức Huy'),
(216432,	0363425624,	'staff',	N'Trần Đức Việt'),
(216324,	0988342324,	'staff',	N'Bùi Ngọc Diệp'),
(216865,	0853523236,	'staff',	N'Trương Đinh Trọnng'),
(216765,	0864345325,	'staff',	N'Lương Đức Thiện'),
(202526,	0376986778,	'senior',	N'Ngô Trọng Hiếu'),
(197001,	0376572148,	'manager',	N'Đinh Tuấn Dũng'),
(217002,	0901583535,	'staff',	N'Phạm Ngoc Thạch'),
(217003,	0915137583,	'staff',	N'Vũ Đức Mạnh');

//Nhập dữ liệu

INSERT INTO PHIM (TenPhim, TheLoai, Maphim, GioiHanDoTuoi, ThoiLuong, QuocGia, DaoDien, Rated, DvChinh, DinhDang)
VALUES 
('The Dark Knight Rises','Hanh dong, Tam ly', 'TDKR2023', 13, 164, N'Mỹ', 'Christopher Nolan', 'PG-13', 'Christian Bale, Tom Hardy, Anne Hathaway', '2D'),
('The Nun', 'Kinh di', 'TNUN2023', 16, 96, N'Mỹ', 'Corin Hardy', 'R', 'Taissa Farmiga, Demián Bichir, Jonas Bloquet', '2D'),
('A Haunting in Venice','Trinh tham', 'AHIV2023', 13, 103, N'Mỹ', 'Kenneth Branagh', 'PG-13', 'Kenneth Branagh, Michelle Yeoh, Jamie Dornan', '2D'),
('The Expendable 4','Hanh Dong', 'TE4_2023', 16, 103, N'Mỹ', 'Scott Waugh', 'R', 'Jason Statham, 50 Cent, Megan Fox', '2D'),
('Oppenheimer','Tieu su', 'OPP2023', 13, 180, N'Mỹ', 'Christopher Nolan', 'PG-13', 'Cillian Murphy, Emily Blunt, Robert Downey Jr.', '2D'),
(N'Cù lao xác sống','Kinh di, Giat gan', 'CLXS2023', 16, 93, N'Việt Nam', N'Nguyễn Thành Nam', 'R', N'Huỳnh Đông, Ốc Thanh Vân, La Thành, Lê Lộc', '2D'),
('Doraemon movie 42','Hoat hinh, Gia dinh', 'DM42_2023', 0, 107, N'Nhật Bản', 'Shin-Ei Animation', 'G', 'Doraemon, Nobita', '2D');

INSERT INTO PHONGCHIEU (MaPhong, TenPhongChieu)
VALUES
('P01', 'CINEMA 1'),
('P02', 'CINEMA 2'),
('P03', 'CINEMA 3');

INSERT INTO SUATCHIEU (MaSuatchieu, NgayChieu, GioChieu, MaNV, Maphim, MaPhong)
VALUES 
(12000, '2023-09-01', '15:00:00', 197001, 'OPP2023', 'P01'),
(12001, '2023-09-01', '18:00:00', 197001, 'TNUN2023', 'P02'),
(12002, '2023-09-02', '16:00:00', 197001, 'AHIV2023', 'P03'),
(12003, '2023-09-02', '19:00:00', 197001, 'TE4_2023', 'P01'),
(12004, '2023-09-03', '18:00:00', 195563, 'OPP2023', 'P02'),
(12005, '2023-09-03', '20:00:00', 195563, 'CLXS2023', 'P03'),
(12006, '2023-09-04', '19:00:00', 197001, 'DM42_2023', 'P01'),
(12007, '2023-09-04', '15:00:00', 197001, 'TDKR2023', 'P01'),
(12008, '2023-09-05', '13:00:00', 195563, 'TNUN2023', 'P02'),
(12009, '2023-09-05', '16:00:00', 197001, 'AHIV2023', 'P03'),
(12010, '2023-09-06', '19:00:00', 197001, 'TE4_2023', 'P01'),
(12011, '2023-09-06', '13:00:00', 195563, 'OPP2023', 'P02'),
(12012, '2023-09-06', '15:00:00', 195563, 'CLXS2023', 'P03'),
(12013, '2023-09-07', '16:00:00', 197001, 'DM42_2023', 'P01'),
(12014, '2023-10-01', '19:00:00', 197001, 'TDKR2023', 'P02'),
(12015, '2023-10-02', '10:00:00', 197001, 'TNUN2023', 'P03'),
(12016, '2023-10-03', '13:00:00', 195563, 'AHIV2023', 'P01'),
(12017, '2023-10-04', '16:00:00', 195563, 'TE4_2023', 'P02'),
(12018, '2023-10-05', '19:00:00', 195563, 'OPP2023', 'P03'),
(12019, '2023-10-06', '10:00:00', 197001, 'CLXS2023', 'P01'),
(12020, '2023-10-07', '13:00:00', 197001, 'DM42_2023', 'P02'),
(12021, '2023-10-08', '19:00:00', 197001, 'TDKR2023', 'P02'),
(12022, '2023-10-09', '10:00:00', 195563, 'TNUN2023', 'P03'),
(12023, '2023-10-10', '13:00:00', 195563, 'AHIV2023', 'P01'),
(12024, '2023-10-11', '16:00:00', 197001, 'TE4_2023', 'P02'),
(12025, '2023-10-12', '19:00:00', 197001, 'OPP2023', 'P03'),
(12026, '2023-10-13', '10:00:00', 195563, 'CLXS2023', 'P01'),
(12028, '2023-10-14', '13:00:00', 195563, 'DM42_2023', 'P01'),
(12029, '2023-10-14', '15:40:00', 195563, 'AHIV2023', 'P02'),
(12030, '2023-10-14', '18:30:00', 197001, 'TDKR2023', 'P03'),
(12031, '2023-10-14', '20:00:00', 197001, 'DM42_2023', 'P01'),
(12032, '2023-10-14', '21:00:00', 197001, 'TNUN2023', 'P02'),
(12033, '2023-10-15', '16:00:00', 195563, 'TE4_2023', 'P02'),
(12034, '2023-10-15', '19:00:00', 195563, 'OPP2023', 'P03'),
(12035, '2023-10-16', '10:00:00', 195563, 'AHIV2023', 'P01'),
(12036, '2023-10-16', '19:00:00', 195563, 'AHIV2023', 'P01'),
(12037, '2023-10-17', '13:00:00', 197001, 'DM42_2023', 'P02'),
(12038, '2023-10-18', '19:00:00', 195563, 'TDKR2023', 'P02'),
(12039, '2023-10-19', '10:00:00', 195563, 'TNUN2023', 'P03'),
(12040, '2023-10-20', '13:00:00', 195563, 'AHIV2023', 'P01'),
(12041, '2023-10-20', '21:00:00', 195563, 'TNUN2023', 'P03'),
(12042, '2023-10-21', '20:20:00', 197001, 'TDKR2023', 'P02'),
(12043, '2023-10-22', '19:00:00', 197001, 'OPP2023', 'P03'),
(12044, '2023-10-23', '10:00:00', 195563, 'CLXS2023', 'P01'),
(12045, '2023-10-24', '13:00:00', 195563, 'DM42_2023', 'P02');

INSERT INTO GHE (MaGhe, TenGhe, MaPhong)
VALUES 
('P01A01', 'A1', 'P01'),
('P01A02', 'A2', 'P01'),
('P01A03', 'A3', 'P01'),
('P01B01', 'B1', 'P01'),
('P01B02', 'B2', 'P01'),
('P01B03', 'B3', 'P01'),
('P01C01', 'C1', 'P01'),
('P01C02', 'C2', 'P01'),
('P01C03', 'C3', 'P01'),
('P02A01', 'A1', 'P02'),
('P02A02', 'A2', 'P02'),
('P02A03', 'A3', 'P02'),
('P02B01', 'B1', 'P02'),
('P02B02', 'B2', 'P02'),
('P02B03', 'B3', 'P02'),
('P02C01', 'C1', 'P02'),
('P02C02', 'C2', 'P02'),
('P02C03', 'C3', 'P02'),
('P03A01', 'A1', 'P03'),
('P03A02', 'A2', 'P03'),
('P03A03', 'A3', 'P03'),
('P03B01', 'B1', 'P03'),
('P03B02', 'B2', 'P03'),
('P03B03', 'B3', 'P03'),
('P03C01', 'C1', 'P03'),
('P03C02', 'C2', 'P03'),
('P03C03', 'C3', 'P03');

INSERT INTO KHACHHANG (MaKH, TenKH, email, sdt, MatKhau)
VALUES 
(23000, N'Khách Vãng Lai', 'null', 'null', 'null'),
(23001, N'Nguyễn Thanh Tùng', 'mtp@gmail.com', '0901686868', 'mtp123'),
(23002, N'Nguyễn Thanh Tuấn', 'justatee@gmail.com', '0368999888', 'tee123'),
(23003, N'Nguyễn Công Phượng', 'cp1996@gamil.com', '0868123456', 'phuong321'),
(23004, N'Nguyễn Văn Toàn', 'vtoan@gmail.com', '0915888999', 'toan234'),
(23005, N'Nguyễn Duy Mạnh', 'duymanh@gmail.com', '0988687899', 'duymanh1@'),
(23006, N'Nguyễn Tuấn Hưng', 'tuanhung@gmail.com', '0366898989', 'tuanhung111');

INSERT INTO VEXEMPHIM (NgaySuatVe, MaVe, GiaVe, GioSuatVe, MaNV, MaSuatchieu, MaKH, MaGhe)
VALUES 
('2023-09-01', 'VE01', 250000, '15:00:00', 215893, 12000, '23000', 'P01A01'),
('2023-09-01', 'VE02', 250000, '18:00:00', 215893, 12001, '23000', 'P02A01'),
('2023-09-02', 'VE03', 250000, '16:00:00', 215893, 12002, '23000', 'P03A01'),
('2023-09-02', 'VE04', 250000, '19:00:00', 215893, 12003, '23000', 'P01B01'),
('2023-09-03', 'VE05', 250000, '18:00:00', 215239, 12004, '23000', 'P02B01'),
('2023-09-03', 'VE06', 250000, '20:00:00', 215239, 12005, '23000', 'P03B01'),
('2023-09-04', 'VE07', 250000, '19:00:00', 215239, 12006, '23000', 'P01C01'),
('2023-09-04', 'VE08', 250000, '15:00:00', 215239, 12007, '23000', 'P01A02'),
('2023-09-05', 'VE09', 250000, '13:00:00', 215239, 12008, '23000', 'P02A02'),
('2023-09-05', 'VE10', 250000, '16:00:00', 215239, 12009, '23000', 'P03A02'),
('2023-09-06', 'VE11', 250000, '19:00:00', 216324, 12010, '23000', 'P01B02'),
('2023-09-06', 'VE12', 250000, '13:00:00', 216324, 12011, '23000', 'P02B02'),
('2023-09-06', 'VE13', 250000, '15:00:00', 216324, 12012, '23000', 'P03B02'),
('2023-09-07', 'VE14', 250000, '16:00:00', 216324, 12013, '23000', 'P01C02'),
('2023-10-01', 'VE15', 250000, '19:00:00', 216324, 12014, '23000', 'P02C01'),
('2023-10-02', 'VE16', 250000, '10:00:00', 216324, 12015, '23000', 'P03C01'),
('2023-10-03', 'VE17', 250000, '13:00:00', 216324, 12016, '23000', 'P01A03'),
('2023-10-04', 'VE18', 250000, '16:00:00', 216324, 12017, '23000', 'P02A03'),
('2023-10-05', 'VE19', 250000, '19:00:00', 201478, 12018, '23000', 'P03A03'),
('2023-10-06', 'VE20', 250000, '10:00:00', 201478, 12019, '23000', 'P01B03'),
('2023-10-07', 'VE21', 250000, '13:00:00', 201478, 12020, '23000', 'P02B03'),
('2023-10-08', 'VE22', 250000, '19:00:00', 201478, 12021, '23000', 'P02C02'),
('2023-10-09', 'VE23', 250000, '10:00:00', 201478, 12022, '23000', 'P03C02'),
('2023-10-10', 'VE24', 250000, '13:00:00', 201478, 12023, '23000', 'P01A01'),
('2023-10-11', 'VE25', 250000, '16:00:00', 201478, 12024, '23000', 'P02A01'),
('2023-10-12', 'VE26', 250000, '19:00:00', 201478, 12025, '23001', 'P03A01'),
('2023-10-12', 'VE27', 250000, '19:00:00', 215893, 12025, '23001', 'P03A02'),
('2023-10-12', 'VE28', 250000, '19:00:00', 215893, 12025, '23001', 'P03A03'),
('2023-10-12', 'VE29', 250000, '19:00:00', 215893, 12025, '23001', 'P03B01'),
('2023-10-12', 'VE30', 250000, '19:00:00', 215893, 12025, '23001', 'P03B02'),
('2023-10-12', 'VE31', 250000, '19:00:00', 215893, 12025, '23001', 'P03B03'),
('2023-10-13', 'VE32', 250000, '10:00:00', 201478, 12026, '23000', 'P01B01'),
('2023-10-14', 'VE33', 250000, '13:00:00', 201478, 12028, '23000', 'P01A02'),
('2023-10-14', 'VE34', 250000, '15:40:00', 201478, 12029, '23000', 'P02A02'),
('2023-10-14', 'VE35', 250000, '18:30:00', 201478, 12030, '23000', 'P03A02'),
('2023-10-14', 'VE36', 250000, '20:00:00', 201478, 12031, '23000', 'P01B02'),
('2023-10-14', 'VE37', 250000, '21:00:00', 201478, 12032, '23000', 'P02B02'),
('2023-10-15', 'VE38', 250000, '16:00:00', 201478, 12033, '23000', 'P02A03'),
('2023-10-15', 'VE39', 250000, '19:00:00', 195563, 12034, '23001', 'P03A01'),
('2023-10-15', 'VE40', 250000, '19:00:00', 195563, 12034, '23001', 'P03A02'),
('2023-10-15', 'VE41', 250000, '19:00:00', 195563, 12034, '23001', 'P03A03'),
('2023-10-15', 'VE42', 250000, '19:00:00', 195563, 12034, '23001', 'P03B01'),
('2023-10-15', 'VE43', 250000, '19:00:00', 195563, 12034, '23001', 'P03B02'),
('2023-10-15', 'VE44', 250000, '19:00:00', 195563, 12034, '23001', 'P03B03'),
('2023-10-16', 'VE45', 250000, '10:00:00', 216432, 12035, '23000', 'P01B03'),
('2023-10-16', 'VE46', 250000, '19:00:00', 216432, 12036, '23000', 'P01C01'),
('2023-10-17', 'VE47', 250000, '13:00:00', 216432, 12037, '23000', 'P02C01'),
('2023-10-18', 'VE48', 250000, '19:00:00', 216432, 12038, '23000', 'P02C02'),
('2023-10-19', 'VE49', 250000, '10:00:00', 216432, 12039, '23000', 'P03C02'),
('2023-10-20', 'VE50', 250000, '13:00:00', 216233, 12040, '23000', 'P01A01'),
('2023-10-20', 'VE51', 250000, '21:00:00', 216233, 12041, '23000', 'P03C03'),
('2023-10-21', 'VE52', 300000, '20:20:00', 216233, 12042, '23000', 'P02C01'),
('2023-10-22', 'VE53', 250000, '19:00:00', 216233, 12043, '23000', 'P03C01'),
('2023-10-23', 'VE54', 250000, '10:00:00', 216233, 12044, '23000', 'P01B01'),
('2023-10-24', 'VE55', 250000, '13:00:00', 216233, 12045, '23000', 'P02B01');

//Trả lời truy vấn
//Tạ Minh Công 1 2 3 13 14
--Câu 1
SELECT GioChieu,MaPhong,TenPhim
FROM SUATCHIEU
INNER JOIN PHIM
ON PHIM.Maphim=SUATCHIEU.Maphim
WHERE NgayChieu='2023/10/14';
 
 --Câu 2
 SELECT TenPhim,GioiHanDoTuoi
 FROM PHIM
 WHERE GioiHanDoTuoi<13;

 --Câu 3
 SELECT TenPhim,GiaVe,GioChieu
 FROM PHIM
 INNER JOIN SUATCHIEU
 ON SUATCHIEU.Maphim=PHIM.Maphim
 INNER JOIN VEXEMPHIM
 ON VEXEMPHIM.MaSuatchieu=SUATCHIEU.MaSuatchieu
 where	NgayChieu='2023-10-21' and TenPhim='The Dark Knight Rises' and GioChieu = '20:20:00';


--Câu 13
SELECT TenPhim,COUNT(*) as 'SoVe'
FROM VEXEMPHIM
INNER JOIN SUATCHIEU
ON SUATCHIEU.MaSuatchieu=VEXEMPHIM.MaSuatchieu
INNER JOIN PHIM
ON PHIM.Maphim=SUATCHIEU.Maphim
WHERE TenPhim='Oppenheimer'
GROUP BY TenPhim;

--Câu 14
SELECT TenPhim,SUM(GiaVe) as 'SoTien'
FROM VEXEMPHIM
INNER JOIN SUATCHIEU
ON SUATCHIEU.MaSuatchieu=VEXEMPHIM.MaSuatchieu
INNER JOIN PHIM
ON PHIM.Maphim=SUATCHIEU.Maphim
WHERE TenPhim='Oppenheimer'
GROUP BY TenPhim;

//Nguyễn Trung Bắc 4 5 6

--Câu 4
SELECT TenPhongChieu, COUNT(MaGhe) AS SoGhe
FROM ghe INNER JOIN phongchieu ON ghe.MaPhong = phongchieu.MaPhong
WHERE TenPhongChieu = 'CINEMA 1'
GROUP BY TenPhongChieu;

--Câu 5
SELECT TenGhe, TenPhongChieu
FROM ghe INNER JOIN suatchieu ON ghe.MaPhong = suatchieu.MaPhong
INNER JOIN phongchieu ON phongchieu.MaPhong = ghe.MaPhong
LEFT OUTER JOIN vexemphim ON ghe.MaGhe = vexemphim.MaGhe 
AND suatchieu.MaSuatchieu = vexemphim.MaSuatchieu
WHERE suatchieu.Maphim = 'TDKR2023' 
AND suatchieu.NgayChieu = '2023-10-21'
AND suatchieu.GioChieu = '20:20:00'
AND vexemphim.MaVe IS NULL;

--Câu 6
SELECT TenPhim, NgayChieu, GioChieu, TenPhongChieu, COUNT(ghe.MaGhe) AS SoGheTrong
FROM suatchieu INNER JOIN phim ON suatchieu.Maphim = phim.Maphim
INNER JOIN phongchieu ON phongchieu.MaPhong = suatchieu.MaPhong
INNER JOIN ghe ON ghe.MaPhong = suatchieu.MaPhong
LEFT OUTER JOIN vexemphim ON vexemphim.MaSuatchieu = suatchieu.MaSuatchieu
AND vexemphim.MaGhe = ghe.MaGhe
WHERE suatchieu.NgayChieu = '2023-10-20'
AND vexemphim.MaVe IS NULL
GROUP BY TenPhim, NgayChieu, GioChieu, TenPhongChieu

--Câu 11(dự phòng)
SELECT TenKH, COUNT(MaVe) AS SoVeMua
FROM VEXEMPHIM INNER JOIN KhachHang ON VEXEMPHIM.MaKH=KHACHHANG.MaKH
WHERE ngaysuatve < '2023-10-31' 
AND ngaysuatve > '2023-10-01'
AND TenKH != 'Khách Vãng Lai'
GROUP BY TenKH HAVING COUNT(MaVe) >=10;


//Nguyễn Anh Dũng 7 8 9

--Câu 7
SELECT TenPhim,NgayChieu
FROM SUATCHIEU INNER JOIN PHIM ON SUATCHIEU.Maphim= PHIM.Maphim
WHERE TenPhim = 'The Expendable 4';

--Câu 8 (VERSION SQL SERVER)
SELECT TOP 1 TenPhim, GioChieu
FROM PHIM, SUATCHIEU
WHERE PHIM.Maphim = SUATCHIEU.Maphim
AND NgayChieu = '2023-10-20'
ORDER BY GioChieu DESC;

--Câu 9
SELECT TenPhim, TheLoai
FROM PHIM
WHERE TheLoai LIKE 'Kinh Di%';

//Đỗ Văn Quyết 10 11 12

--Câu 10
SELECT TenPhim, PHIM.TheLoai, COUNT(MaVe) AS 'Số vé'
FROM PHIM
INNER JOIN SUATCHIEU ON SUATCHIEU.Maphim=PHIM.Maphim 
INNER JOIN VEXEMPHIM ON SUATCHIEU.MaSuatchieu=VEXEMPHIM.MaSuatchieu
WHERE NgaySuatVe > '2023-10-01' AND NgaySuatVe < '2023-10-31'
GROUP by TenPhim, PHIM.TheLoai
HAVING COUNT(MaVe) = (SELECT TOP 1 COUNT(MaVe)
             FROM PHIM JOIN SUATCHIEU ON SUATCHIEU.Maphim=PHIM.Maphim 
             JOIN VEXEMPHIM ON SUATCHIEU.MaSuatchieu=VEXEMPHIM.MaSuatchieu
			 WHERE NgaySuatVe > '2023-10-01' AND NgaySuatVe < '2023-10-31'
             GROUP by TenPhim, PHIM.TheLoai ORDER BY COUNT(MaVe)DESC);

--Câu 11
SELECT TenKH, a.MaKH, COUNT(MaVe) AS 'Số lần xem'
FROM VEXEMPHIM a INNER JOIN KhachHang b ON a.MaKH=b.MaKH
WHERE ngaysuatve < '2023-10-31' AND ngaysuatve > '2023-10-01' AND a.MaKH - 23000
GROUP BY TenKH, a.MaKH HAVING COUNT(MaVe) >=10

--Câu 12
SELECT TenPhim, NgayChieu, GioChieu, TenPhongChieu
FROM SUATCHIEU INNER JOIN PHONGCHIEU ON SUATCHIEU.MaPhong = PHONGCHIEU.MaPhong
INNER JOIN PHIM ON PHIM.MaPhim = SUATCHIEU.MaPhim
WHERE TenPhim = 'A Haunting in Venice'
AND NgayChieu = '2023-10-16';

//Trần Minh Dương 15

--Câu 15
SELECT SUATCHIEU.NgayChieu, PHONGCHIEU.TenPhongChieu
FROM SUATCHIEU
JOIN PHIM ON SUATCHIEU.Maphim = PHIM.Maphim
JOIN PHONGCHIEU ON SUATCHIEU.MaPhong = PHONGCHIEU.MaPhong
WHERE PHIM.TenPhim = 'THE NUN';




