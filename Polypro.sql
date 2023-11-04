create  DATABASE Polypro
USE Polypro

select * from NhanVien

CREATE TABLE NhanVien(
MaNV nvarchar(50) NOT NULL,
MatKhau nvarchar(50) NOT NULL,
HoTen nvarchar(50) NOT NULL,
VaiTro bit NOT NULL DEFAULT 0,
PRIMARY KEY(MaNV)
)

CREATE TABLE ChuyenDe(
MaCD nchar(5) NOT NULL,
TenCD nvarchar(50) NOT NULL,
HocPhi float NOT NULL DEFAULT 0,
ThoiLuong int NOT NULL DEFAULT 30,
Hinh nvarchar(50) NOT NULL DEFAULT 'chuyen-de.png',
MoTa nvarchar(255) NOT NULL,
PRIMARY KEY(MaCD),
UNIQUE(TenCD),
CHECK(HocPhi >= 0 AND ThoiLuong > 0)
)

CREATE TABLE NguoiHoc(
  MaNH nchar(7) NOT NULL,
  HoTen nvarchar(50) NOT NULL,
  NgaySinh date NOT NULL,
  GioiTinh bit NOT NULL DEFAULT 0,
  DienThoai nvarchar(50) NOT NULL,
  Email nvarchar(50) NOT NULL,
  GhiChu nvarchar(300) NULL,
  MaNV nvarchar(50) NOT NULL,
  NgayDK TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(MaNH)
);

CREATE TABLE KhoaHoc(
  MaKH int AUTO_INCREMENT NOT NULL,
  MaCD nchar(5) NOT NULL,
  HocPhi float NOT NULL DEFAULT 0,
  ThoiLuong int NOT NULL DEFAULT 0,
  NgayKG date NOT NULL,
  GhiChu nvarchar(50) NULL,
  MaNV nvarchar(50) NOT NULL,
  NgayTao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(MaKH),
  CHECK(HocPhi >= 0 AND ThoiLuong > 0),
  FOREIGN KEY (MaCD) REFERENCES ChuyenDe(MaCD) ON UPDATE CASCADE,
  FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV) ON UPDATE CASCADE
);

CREATE TABLE HocVien(
  MaHV int AUTO_INCREMENT NOT NULL,
  MaKH int NOT NULL,
  MaNH nchar(7) NOT NULL,
  Diem float NOT NULL,
  PRIMARY KEY(MaHV),
  UNIQUE(MaKH, MaNH),
  FOREIGN KEY (MaKH) REFERENCES KhoaHoc(MaKH) ON DELETE CASCADE,
  FOREIGN KEY (MaNH) REFERENCES NguoiHoc(MaNH) ON UPDATE CASCADE
);
INSERT INTO NhanVien (MaNV, MatKhau, HoTen, VaiTro)
VALUES
    ('NV001', '123', 'Trưởng Phòng', 1),
    ('NV002', '111', 'Nhân Viên 2', 0),
    ('NV003', '222', 'Nhân Viên 3', 0),
    ('NV004', '333', 'Nhân Viên 4', 0),
    ('NV005', '444', 'Nhân Viên 5', 0),
    ('NV006', '555', 'Nhân Viên 6', 0),
    ('NV007', 'password7', 'Nhân Viên 7', 0),
    ('NV008', 'password8', 'Nhân Viên 8', 0),
    ('NV009', 'password9', 'Nhân Viên 9', 0),
    ('NV010', 'password10', 'Nhân Viên 10', 0);
INSERT INTO ChuyenDe (MaCD, TenCD, HocPhi, ThoiLuong, Hinh, MoTa)
VALUES
    ('CD001', 'Lập trình Java cơ bản', 300, 90, 'chuyen-de-1.jpg', 'Mô tả chuyên đề 1'),
    ('CD002', 'Lập trình Java nâng cao', 400, 120, 'chuyen-de-2.jpg', 'Mô tả chuyên đề 2'),
    ('CD003', 'Lập trình web với HTML/CSS', 200, 60, 'chuyen-de-3.jpg', 'Mô tả chuyên đề 3'),
    ('CD004', 'Lập trình Python căn bản', 250, 75, 'chuyen-de-4.jpg', 'Mô tả chuyên đề 4'),
    ('CD005', 'Lập trình C++ nâng cao', 350, 105, 'chuyen-de-5.jpg', 'Mô tả chuyên đề 5'),
    ('CD006', 'Thiết kế UI/UX', 200, 60, 'chuyen-de-6.jpg', 'Mô tả chuyên đề 6'),
    ('CD007', 'Quản trị cơ sở dữ liệu', 300, 90, 'chuyen-de-7.jpg', 'Mô tả chuyên đề 7'),
    ('CD008', 'Lập trình Android căn bản', 350, 105, 'chuyen-de-8.jpg', 'Mô tả chuyên đề 8'),
    ('CD009', 'Lập trình iOS nâng cao', 400, 120, 'chuyen-de-9.jpg', 'Mô tả chuyên đề 9'),
    ('CD010', 'Machine Learning', 450, 135, 'chuyen-de-10.jpg', 'Mô tả chuyên đề 10');
INSERT INTO NguoiHoc (MaNH, HoTen, NgaySinh, GioiTinh, DienThoai, Email, GhiChu, MaNV)
VALUES
    ('NH001', 'Người Học 1', '1995-03-15', 1, '0901234561', 'nh1@example.com', 'Ghi chú người học 1', 'NV001'),
    ('NH002', 'Người Học 2', '1998-06-20', 0, '0901234562', 'nh2@example.com', 'Ghi chú người học 2', 'NV001'),
    ('NH003', 'Người Học 3', '1990-01-10', 1, '0901234563', 'nh3@example.com', 'Ghi chú người học 3', 'NV001'),
    ('NH004', 'Người Học 4', '1997-11-25', 0, '0901234564', 'nh4@example.com', 'Ghi chú người học 4', 'NV001'),
    ('NH005', 'Người Học 5', '1993-09-08', 1, '0901234565', 'nh5@example.com', 'Ghi chú người học 5', 'NV001'),
    ('NH006', 'Người Học 6', '1999-04-30', 0, '0901234566', 'nh6@example.com', 'Ghi chú người học 6', 'NV002'),
    ('NH007', 'Người Học 7', '1996-02-17', 1, '0901234567', 'nh7@example.com', 'Ghi chú người học 7', 'NV001'),
    ('NH008', 'Người Học 8', '1994-08-03', 0, '0901234568', 'nh8@example.com', 'Ghi chú người học 8', 'NV002'),
    ('NH009', 'Người Học 9', '1991-07-12', 1, '0901234569', 'nh9@example.com', 'Ghi chú người học 9', 'NV001'),
    ('NH010', 'Người Học 10', '1998-12-05', 0, '0901234570', 'nh10@example.com', 'Ghi chú người học 10', 'NV002');
INSERT INTO KhoaHoc (MaCD, HocPhi, ThoiLuong, NgayKG, GhiChu, MaNV)
VALUES
    ('CD001', 1000.0, 24, '2023-09-20', 'Ghi chú 1', 'NV001'),
    ('CD002', 800.0, 20, '2023-09-22', 'Ghi chú 2', 'NV002'),
    ('CD003', 1200.0, 30, '2023-09-25', 'Ghi chú 3', 'NV001'),
    ('CD004', 900.0, 18, '2023-09-28', 'Ghi chú 4', 'NV002'),
    ('CD005', 1500.0, 36, '2023-10-01', 'Ghi chú 5', 'NV001'),
    ('CD006', 600.0, 15, '2023-10-05', 'Ghi chú 6', 'NV002'),
    ('CD007', 1100.0, 27, '2023-10-10', 'Ghi chú 7', 'NV001'),
    ('CD008', 750.0, 21, '2023-10-15', 'Ghi chú 8', 'NV002'),
    ('CD009', 1300.0, 33, '2023-10-20', 'Ghi chú 9', 'NV001'),
    ('CD010', 950.0, 19, '2023-10-25', 'Ghi chú 10', 'NV002');
    
    SELECT hv.*, nh.HoTen FROM HocVien hv JOIN NguoiHoc nh ON nh.MaNH=hv.MaNH WHERE MaKH= 1
    

INSERT INTO HocVien (MaKH, MaNH, Diem)
VALUES
    (1, 'NH001', 8.5),
    (1, 'NH002', 7.0),
    (2, 'NH003', 9.0),
    (2, 'NH004', 6.5),
    (3, 'NH005', 8.0),
    (3, 'NH006', 7.2),
    (4, 'NH007', 9.5),
    (4, 'NH008', 7.8),
    (5, 'NH009', 8.7),
    (5, 'NH010', 7.3);
    
    SELECT * FROM NguoiHoc WHERE HoTen LIKE '%%'
    
    
    -- Số người học từng năm
DELIMITER //
CREATE PROCEDURE sp_ThongKeNguoiHoc()
BEGIN
    SELECT
        YEAR(NgayDK) AS Nam,
        COUNT(*) AS SoLuong,
        MIN(NgayDK) AS DauTien,
        MAX(NgayDK) AS CuoiCung
    FROM NguoiHoc
    GROUP BY YEAR(NgayDK);
END;
//
DELIMITER ;


-- Doanh thu theo chuyên đề
DELIMITER //
CREATE PROCEDURE sp_ThongKeDoanhThu(IN p_Year INT)
BEGIN
    SELECT
        cd.TenCD AS ChuyenDe,
        COUNT(DISTINCT kh.MaKH) AS SoKH,
        COUNT(hv.MaHV) AS SoHV,
        SUM(kh.HocPhi) AS DoanhThu,
        MIN(kh.HocPhi) AS ThapNhat,
        MAX(kh.HocPhi) AS CaoNhat,
        AVG(kh.HocPhi) AS TrungBinh
    FROM KhoaHoc kh
    JOIN HocVien hv ON kh.MaKH = hv.MaKH
    JOIN ChuyenDe cd ON cd.MaCD = kh.MaCD
    WHERE YEAR(kh.NgayKG) = p_Year
    GROUP BY cd.TenCD;
END;
//
DELIMITER ;

--  Học viên theo chuyên đề
DELIMITER //
CREATE PROCEDURE sp_ThongKeDiem()
BEGIN
    SELECT
        cd.TenCD AS ChuyenDe,
        COUNT(hv.MaHV) AS SoHV,
        MIN(hv.Diem) AS ThapNhat,
        MAX(hv.Diem) AS CaoNhat,
        AVG(hv.Diem) AS TrungBinh
    FROM KhoaHoc kh
    JOIN HocVien hv ON kh.MaKH = hv.MaKH
    JOIN ChuyenDe cd ON cd.MaCD = kh.MaCD
    GROUP BY cd.TenCD;
END;
//
DELIMITER ;


-- Bảng điểm 
DELIMITER //
CREATE PROCEDURE sp_BangDiem(IN p_MaKH INT)
BEGIN
    SELECT
        nh.MaNH,
        nh.HoTen,
        hv.Diem
    FROM HocVien hv
    JOIN NguoiHoc nh ON nh.MaNH = hv.MaNH
    WHERE hv.MaKH = p_MaKH
    ORDER BY hv.Diem DESC;
END;
//
DELIMITER ;
    
call sp_BangDiem (1)


























INSERT INTO NguoiHoc (MaNH, HoTen, NgaySinh, GioiTinh, DienThoai, Email, GhiChu, MaNV, NgayDK)
VALUES
    ('NH001', 'Nguyễn Văn A', '1990-01-15', 1, '0123456789', 'nguyenvana@email.com', 'Ghi chú 1', 'NV001', '2023-09-16'),
    ('NH002', 'Trần Thị B', '1995-05-20', 0, '0987654321', 'tranthib@email.com', 'Ghi chú 2', 'NV002', '2023-09-16'),
    ('NH003', 'Lê Văn C', '1988-08-10', 1, '0365478952', 'levanc@email.com', 'Ghi chú 3', 'NV001', '2023-09-16'),
    ('NH004', 'Phạm Thị D', '1992-03-25', 0, '0654789321', 'phamthid@email.com', 'Ghi chú 4', 'NV002', '2023-09-16'),
    ('NH005', 'Hoàng Văn E', '1998-07-05', 1, '0123456780', 'hoangvane@email.com', 'Ghi chú 5', 'NV001', '2023-09-16'),
    ('NH006', 'Mai Thị F', '1993-11-18', 0, '0987654322', 'maithif@email.com', 'Ghi chú 6', 'NV002', '2023-09-16'),
    ('NH007', 'Nguyễn Văn G', '1997-04-30', 1, '0365478953', 'nguyenvang@email.com', 'Ghi chú 7', 'NV001', '2023-09-16'),
    ('NH008', 'Trần Thị H', '1991-09-12', 0, '0654789322', 'tranthih@email.com', 'Ghi chú 8', 'NV002', '2023-09-16'),
    ('NH009', 'Lê Văn I', '1996-02-08', 1, '0123456781', 'levani@email.com', 'Ghi chú 9', 'NV001', '2023-09-16'),
    ('NH010', 'Phạm Thị K', '1994-06-22', 0, '0987654323', 'phamthik@email.com', 'Ghi chú 10', 'NV002', '2023-09-16');

INSERT into ChuyenDe VALUES (N'JAV01', N'Lập trình Java cơ bản', 300, 90, N'GAME.png', N'JAV01 - Lập trình Java cơ bản'),
  (N'JAV02', N'Lập trình Java nâng cao', 300, 90, N'HTCS.jpg', N'JAV02 - Lập trình Java nâng cao'),
  (N'JAV03', N'Lập trình mạng với Java', 200, 70, N'INMA.jpg', N'JAV03 - Lập trình mạng với Java'),
  (N'JAV04', N'Lập trình desktop với Swing', 200, 70, N'LAYO.jpg', N'JAV04 - Lập trình desktop với Swing'),
  (N'PRO01', N'Dự án với công nghệ MS.NET MVC', 300, 90, N'MOWE.png', N'PRO01 - Dự án với công nghệ MS.NET MVC'),
  (N'PRO02', N'Dự án với công nghệ Spring MVC', 300, 90, N'Subject.png', N'PRO02 - Dự án với công nghệ Spring MVC'),
  (N'PRO03', N'Dự án với công nghệ Servlet/JSP', 300, 90, N'GAME.png', N'PRO03 - Dự án với công nghệ Servlet/JSP'),
 (N'PRO04', N'Dự án với AngularJS & WebAPI', 300, 90, N'HTCS.jpg', N'PRO04 - Dự án với AngularJS & WebAPI'),
 (N'PRO05', N'Dự án với Swing & JDBC', 300, 90, N'INMA.jpg', N'PRO05 - Dự án với Swing & JDBC'),
  (N'PRO06', N'Dự án với WindowForm', 300, 90, N'LAYO.jpg', N'PRO06 - Dự án với WindowForm'),
  (N'RDB01', N'Cơ sở dữ liệu SQL Server', 100, 50, N'MOWE.png', N'RDB01 - Cơ sở dữ liệu SQL Server'),
  (N'RDB02', N'Lập trình JDBC', 150, 60, N'Subject.png', N'RDB02 - Lập trình JDBC'),
  (N'RDB03', N'Lập trình cơ sở dữ liệu Hibernate', 250, 80, N'GAME.png', N'RDB03 - Lập trình cơ sở dữ liệu Hibernate'),
 (N'SER01', N'Lập trình web với Servlet/JSP', 350, 100, N'HTCS.jpg', N'SER01 - Lập trình web với Servlet/JSP'),
  (N'SER02', N'Lập trình Spring MVC', 400, 110, N'INMA.jpg', N'SER02 - Lập trình Spring MVC'),
  (N'SER03', N'Lập trình MS.NET MVC', 400, 110, N'LAYO.jpg', N'SER03 - Lập trình MS.NET MVC'),
 (N'SER04', N'Xây dựng Web API với Spring MVC & ASP.NET MVC', 200, 70, N'MOWE.png', N'SER04 - Xây dựng Web API với Spring MVC & ASP.NET MVC'),
 (N'WEB01', N'Thiết kế web với HTML và CSS', 200, 70, N'Subject.png', N'WEB01 - Thiết kế web với HTML và CSS'),
  (N'WEB02', N'Thiết kế web với Bootstrap', 0, 40, N'GAME.png', N'WEB02 - Thiết kế web với Bootstrap'),
  (N'WEB03', N'Lập trình front-end với JavaScript và jQuery', 150, 60, N'HTCS.jpg', N'WEB03 - Lập trình front-end với JavaScript và jQuery'),
  (N'WEB04', N'Lập trình AngularJS', 250, 80, N'INMA.jpg', N'WEB04 - Lập trình AngularJS');
SET IDENTITY_INSERT [dbo].[HocVien] ON 

INSERT into HocVien VALUES (1, 2, N'PS01638', -1),
 (2, 2, N'PS02037', -1),
(3, 2, N'PS02771', -1),
 (5, 2, N'PS02930', -1),
(7, 2, N'PS02983', -1),
 (8, 2, N'PS02988', -1),
 (11, 3, N'PS01638', -1),
 (12, 3, N'PS02037', -1),
 (13, 3, N'PS02771', -1),
 (14, 3, N'PS02867', -1),
 (15, 3, N'PS02930', -1),
 (16, 1, N'PS01638', 8),
 (17, 1, N'PS02037', 9),
 (19, 1, N'PS02867', 3),
 (20, 1, N'PS02930', 7),
(33, 1, N'PS02771', 8),
 (34, 1, N'PS02979', 4),
(35, 1, N'PS02983', 6),
 (36, 1, N'PS02988', -1),
 (37, 1, N'PS03031', -1),
(38, 1, N'PS03046', -1),
(39, 1, N'PS03080', -1),
(40, 1, N'PS03088', -1),
(41, 1, N'PS03096', -1),
 (42, 1, N'PS03104', -1),
 (43, 1, N'PS03120', -1),
 (44, 1, N'PS03130', -1);
SET IDENTITY_INSERT [dbo].[HocVien] OFF
SET IDENTITY_INSERT [dbo].[KhoaHoc] ON 

INSERT into KhoaHoc VALUES (1, N'PRO02', 300, 90, CAST(0xBF3D0B00 AS Date), N'', N'TeoNV', CAST(0xB53D0B00 AS Date))
 (2, N'PRO03', 300, 90, CAST(0xBF3D0B00 AS Date), N'', N'TeoNV', CAST(0xB53D0B00 AS Date))
(3, N'RDB01', 100, 50, CAST(0xBF3D0B00 AS Date), N'', N'TeoNV', CAST(0xB53D0B00 AS Date))
 (4, N'JAV01', 250, 80, CAST(0xBF3D0B00 AS Date), N'', N'TeoNV', CAST(0xB53D0B00 AS Date))
SET IDENTITY_INSERT [dbo].[KhoaHoc] OFF
INSERT into NguoiHoc values (N'PS01638', N'LỮ HUY CƯỜNG', CAST(0xAF170B00 AS Date), 1, N'0928768265', N'PS01638@fpt.edu.vn', N'0928768265 - LỮ HUY CƯỜNG', N'PheoNC', CAST(0xAF170B00 AS Date)),
 (N'PS02037', N'ĐỖ VĂN MINH', CAST(0xC6190B00 AS Date), 1, N'0968095685', N'PS02037@fpt.edu.vn', N'0968095685 - ĐỖ VĂN MINH', N'PheoNC', CAST(0xC6190B00 AS Date)),
 (N'PS02771', N'NGUYỄN TẤN HIẾU', CAST(0x2E220B00 AS Date), 1, N'0927594734', N'PS02771@fpt.edu.vn', N'0927594734 - NGUYỄN TẤN HIẾU', N'PheoNC', CAST(0x2E220B00 AS Date)),
 (N'PS02867', N'NGUYỄN HỮU TRÍ', CAST(0xEB200B00 AS Date), 1, N'0946984711', N'PS02867@fpt.edu.vn', N'0946984711 - NGUYỄN HỮU TRÍ', N'TeoNV', CAST(0xEB200B00 AS Date)),
 (N'PS02930', N'TRẦN VĂN NAM', CAST(0xA1240B00 AS Date), 1, N'0924774498', N'PS02930@fpt.edu.vn', N'0924774498 - TRẦN VĂN NAM', N'TeoNV', CAST(0xA1240B00 AS Date)),
(N'PS02979', N'ĐOÀN TRẦN NHẬT VŨ', CAST(0x671C0B00 AS Date), 1, N'0912374818', N'PS02979@fpt.edu.vn', N'0912374818 - ĐOÀN TRẦN NHẬT VŨ', N'TeoNV', CAST(0x671C0B00 AS Date)),
 (N'PS02983', N'NGUYỄN HOÀNG THIÊN PHƯỚC', CAST(0x681A0B00 AS Date), 1, N'0912499836', N'PS02983@fpt.edu.vn', N'0912499836 - NGUYỄN HOÀNG THIÊN PHƯỚC', N'PheoNC', CAST(0x681A0B00 AS Date)),
(N'PS02988', N'HỒ HỮU HẬU', CAST(0x311A0B00 AS Date), 1, N'0924984876', N'PS02988@fpt.edu.vn', N'0924984876 - HỒ HỮU HẬU', N'PheoNC', CAST(0x311A0B00 AS Date)),
(N'PS03031', N'PHAN TẤN VIỆT', CAST(0x21160B00 AS Date), 1, N'0924832716', N'PS03031@fpt.edu.vn', N'0924832716 - PHAN TẤN VIỆT', N'PheoNC', CAST(0x21160B00 AS Date)),
 (N'PS03046', N'NGUYỄN CAO PHƯỚC', CAST(0xDE150B00 AS Date), 1, N'0977117727', N'PS03046@fpt.edu.vn', N'0977117727 - NGUYỄN CAO PHƯỚC', N'PheoNC', CAST(0xDE150B00 AS Date)),
 (N'PS03080', N'HUỲNH THANH HUY', CAST(0x701C0B00 AS Date), 1, N'0916436052', N'PS03080@fpt.edu.vn', N'0916436052 - HUỲNH THANH HUY', N'PheoNC', CAST(0x701C0B00 AS Date)),
 (N'PS03088', N'NGUYỄN HOÀNG TRUNG', CAST(0x24180B00 AS Date), 1, N'0938101529', N'PS03088@fpt.edu.vn', N'0938101529 - NGUYỄN HOÀNG TRUNG', N'PheoNC', CAST(0x24180B00 AS Date)),
(N'PS03096', N'ĐOÀN HỮU KHANG', CAST(0xAB1B0B00 AS Date), 1, N'0945196719', N'PS03096@fpt.edu.vn', N'0945196719 - ĐOÀN HỮU KHANG', N'PheoNC', CAST(0xAB1B0B00 AS Date)),
(N'PS03104', N'LÊ THÀNH PHƯƠNG', CAST(0x3E1A0B00 AS Date), 1, N'0922948096', N'PS03104@fpt.edu.vn', N'0922948096 - LÊ THÀNH PHƯƠNG', N'PheoNC', CAST(0x3E1A0B00 AS Date)),
 (N'PS03120', N'PHẠM NGỌC NHẬT TRƯỜNG', CAST(0x48230B00 AS Date), 1, N'0994296169', N'PS03120@fpt.edu.vn', N'0994296169 - PHẠM NGỌC NHẬT TRƯỜNG', N'PheoNC', CAST(0x48230B00 AS Date)),
(N'PS03130', N'ĐẶNG BẢO VIỆT', CAST(0xEF150B00 AS Date), 1, N'0917749344', N'PS03130@fpt.edu.vn', N'0917749344 - ĐẶNG BẢO VIỆT', N'PheoNC', CAST(0xEF150B00 AS Date)),
(N'PS03134', N'LÊ DUY BẢO', CAST(0x2E1F0B00 AS Date), 1, N'0926714368', N'PS03134@fpt.edu.vn', N'0926714368 - LÊ DUY BẢO', N'PheoNC', CAST(0x2E1F0B00 AS Date)),
 (N'PS03172', N'NGUYỄN ANH TUẤN', CAST(0xCA180B00 AS Date), 1, N'0920020472', N'PS03172@fpt.edu.vn', N'0920020472 - NGUYỄN ANH TUẤN', N'PheoNC', CAST(0xCA180B00 AS Date));
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03202', N'PHAN QUỐC QUI', CAST(0x741E0B00 AS Date), 1, N'0930649274', N'PS03202@fpt.edu.vn', N'0930649274 - PHAN QUỐC QUI', N'PheoNC', CAST(0x741E0B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03203', N'ĐẶNG LÊ QUANG VINH', CAST(0xC4150B00 AS Date), 1, N'0920197355', N'PS03203@fpt.edu.vn', N'0920197355 - ĐẶNG LÊ QUANG VINH', N'PheoNC', CAST(0xC4150B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03205', N'NGUYỄN MINH SANG', CAST(0x5E1D0B00 AS Date), 1, N'0967006218', N'PS03205@fpt.edu.vn', N'0967006218 - NGUYỄN MINH SANG', N'PheoNC', CAST(0x5E1D0B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03222', N'TRẦM MINH MẪN', CAST(0xE71F0B00 AS Date), 1, N'0911183649', N'PS03222@fpt.edu.vn', N'0911183649 - TRẦM MINH MẪN', N'PheoNC', CAST(0xE71F0B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03230', N'NGUYỄN PHẠM MINH HÂN', CAST(0x26250B00 AS Date), 1, N'0983469892', N'PS03230@fpt.edu.vn', N'0983469892 - NGUYỄN PHẠM MINH HÂN', N'PheoNC', CAST(0x26250B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03233', N'LƯU KIM HOÀNG DUY', CAST(0x0B1F0B00 AS Date), 1, N'0938357735', N'PS03233@fpt.edu.vn', N'0938357735 - LƯU KIM HOÀNG DUY', N'PheoNC', CAST(0x0B1F0B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03251', N'TRẦN QUANG VŨ', CAST(0x4C240B00 AS Date), 1, N'0914531913', N'PS03251@fpt.edu.vn', N'0914531913 - TRẦN QUANG VŨ', N'PheoNC', CAST(0x4C240B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03304', N'BÙI NGỌC THUẬN', CAST(0xFE1C0B00 AS Date), 1, N'0999794115', N'PS03304@fpt.edu.vn', N'0999794115 - BÙI NGỌC THUẬN', N'PheoNC', CAST(0xFE1C0B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03306', N'HỒ VĂN HÀNH', CAST(0x06190B00 AS Date), 1, N'0912277868', N'PS03306@fpt.edu.vn', N'0912277868 - HỒ VĂN HÀNH', N'PheoNC', CAST(0x06190B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03308', N'TRẦN VIẾT HÙNG', CAST(0xD0220B00 AS Date), 1, N'0916050164', N'PS03308@fpt.edu.vn', N'0916050164 - TRẦN VIẾT HÙNG', N'PheoNC', CAST(0xD0220B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03325', N'NGUYỄN HOÀNG MINH ĐỨC', CAST(0xAB1F0B00 AS Date), 1, N'0912234437', N'PS03325@fpt.edu.vn', N'0912234437 - NGUYỄN HOÀNG MINH ĐỨC', N'PheoNC', CAST(0xAB1F0B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03346', N'PHAN THANH PHONG', CAST(0xD7150B00 AS Date), 1, N'0937891282', N'PS03346@fpt.edu.vn', N'0937891282 - PHAN THANH PHONG', N'PheoNC', CAST(0xD7150B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03383', N'TRẦN VŨ LUÂN', CAST(0x8E210B00 AS Date), 1, N'0962030316', N'PS03383@fpt.edu.vn', N'0962030316 - TRẦN VŨ LUÂN', N'PheoNC', CAST(0x8E210B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03389', N'VŨ ĐỨC TUẤN', CAST(0x411A0B00 AS Date), 1, N'0911637415', N'PS03389@fpt.edu.vn', N'0911637415 - VŨ ĐỨC TUẤN', N'PheoNC', CAST(0x411A0B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03410', N'TRẦN  NHẠT', CAST(0x3C190B00 AS Date), 1, N'0946219377', N'PS03410@fpt.edu.vn', N'0946219377 - TRẦN  NHẠT', N'PheoNC', CAST(0x3C190B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03411', N'TRƯƠNG THÀNH ĐẠT', CAST(0x3F1B0B00 AS Date), 1, N'0991509408', N'PS03411@fpt.edu.vn', N'0991509408 - TRƯƠNG THÀNH ĐẠT', N'PheoNC', CAST(0x3F1B0B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03425', N'TÔ VĂN NĂNG', CAST(0x6E190B00 AS Date), 1, N'0915134551', N'PS03425@fpt.edu.vn', N'0915134551 - TÔ VĂN NĂNG', N'PheoNC', CAST(0x6E190B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03454', N'NGUYỄN NHẬT VĨNH', CAST(0x57230B00 AS Date), 1, N'0917886371', N'PS03454@fpt.edu.vn', N'0917886371 - NGUYỄN NHẬT VĨNH', N'PheoNC', CAST(0x57230B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03472', N'NGUYỄN VĂN HUY', CAST(0xD8150B00 AS Date), 1, N'0960620997', N'PS03472@fpt.edu.vn', N'0960620997 - NGUYỄN VĂN HUY', N'PheoNC', CAST(0xD8150B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03488', N'NGUYỄN NHƯ NGỌC', CAST(0x651D0B00 AS Date), 0, N'0912880267', N'PS03488@fpt.edu.vn', N'0912880267 - NGUYỄN NHƯ NGỌC', N'PheoNC', CAST(0x651D0B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03530', N'PHẠM THÀNH TÂM', CAST(0x4D240B00 AS Date), 1, N'0918161783', N'PS03530@fpt.edu.vn', N'0918161783 - PHẠM THÀNH TÂM', N'PheoNC', CAST(0x4D240B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03553', N'ĐINH TẤN CÔNG', CAST(0xEA240B00 AS Date), 1, N'0918182551', N'PS03553@fpt.edu.vn', N'0918182551 - ĐINH TẤN CÔNG', N'PheoNC', CAST(0xEA240B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03561', N'LÊ MINH ĐIỀN', CAST(0xE91C0B00 AS Date), 1, N'0948199564', N'PS03561@fpt.edu.vn', N'0948199564 - LÊ MINH ĐIỀN', N'PheoNC', CAST(0xE91C0B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03596', N'NGUYỄN THANH HIỀN', CAST(0xED170B00 AS Date), 1, N'0910545901', N'PS03596@fpt.edu.vn', N'0910545901 - NGUYỄN THANH HIỀN', N'PheoNC', CAST(0xED170B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03603', N'LÊ PHẠM KIM THANH', CAST(0x501C0B00 AS Date), 0, N'0924696779', N'PS03603@fpt.edu.vn', N'0924696779 - LÊ PHẠM KIM THANH', N'PheoNC', CAST(0x501C0B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03610', N'TRẦN ĐÌNH TRƯỜNG', CAST(0xF41C0B00 AS Date), 1, N'0941528106', N'PS03610@fpt.edu.vn', N'0941528106 - TRẦN ĐÌNH TRƯỜNG', N'PheoNC', CAST(0xF41C0B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03614', N'NGUYỄN VĂN SÁU', CAST(0x37160B00 AS Date), 1, N'0940711328', N'PS03614@fpt.edu.vn', N'0940711328 - NGUYỄN VĂN SÁU', N'PheoNC', CAST(0x37160B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03618', N'PHÍ ĐÌNH VIỆT HÙNG', CAST(0xA91F0B00 AS Date), 1, N'0939020097', N'PS03618@fpt.edu.vn', N'0939020097 - PHÍ ĐÌNH VIỆT HÙNG', N'PheoNC', CAST(0xA91F0B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03638', N'PHẠM NHẬT MINH', CAST(0x86200B00 AS Date), 1, N'0927771672', N'PS03638@fpt.edu.vn', N'0927771672 - PHẠM NHẬT MINH', N'PheoNC', CAST(0x86200B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03640', N'LƯU THANH NGỌC', CAST(0x591B0B00 AS Date), 0, N'0918358164', N'PS03640@fpt.edu.vn', N'0918358164 - LƯU THANH NGỌC', N'PheoNC', CAST(0x591B0B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03662', N'NGUYỄN CAO NGỌC LỢI', CAST(0x34160B00 AS Date), 1, N'0930260679', N'PS03662@fpt.edu.vn', N'0930260679 - NGUYỄN CAO NGỌC LỢI', N'PheoNC', CAST(0x34160B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03674', N'TRẦN TUẤN ANH', CAST(0xF41E0B00 AS Date), 1, N'0914082094', N'PS03674@fpt.edu.vn', N'0914082094 - TRẦN TUẤN ANH', N'PheoNC', CAST(0xF41E0B00 AS Date))
INSERT into NhanVien VALUES (N'NoPT', N'123456', N'Phạm Thị Nở', 0);
INSERT into NhanVien VALUES (N'PheoNC', N'123456', N'Nguyễn Chí Phèo', 0);
INSERT into NhanVien  VALUES (N'TeoNV', N'123456', N'Nguyễn Văn Tèo', 1);
SET ANSI_PADDING ON

