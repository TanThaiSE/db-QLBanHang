-- Cấu trúc bảng cho bảng `khachhang`
CREATE TABLE `khachhang` (
  `MaKh` varchar(50) NOT NULL,
  `TaiKhoan` varchar(50) NOT NULL,
  `MatKhau` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `DiaChi` varchar(50) NOT NULL,
  `DienThoai` varchar(50) NOT NULL,
  `GioiTinh` varchar(4) NOT NULL,
  `NgaySinh` datetime NOT NULL,
  `HoTen` varchar(50) NOT NULL
);
ALTER TABLE `khachhang` ADD PRIMARY KEY (`MaKh`);

-- Cấu trúc bảng cho bảng `donhang`

CREATE TABLE `donhang` (
  `MaDonHang` varchar(50) NOT NULL,
  `DaThanhToan` varchar(50) NOT NULL,
  `NgayGiao` datetime NOT NULL,
  `NgayDat` datetime NOT NULL,
  `TinhTrangGH` bit(1) NOT NULL,
  `maKH` varchar(50) NOT NULL
);
ALTER TABLE `donhang` ADD PRIMARY KEY (`MaDonHang`);
ALTER TABLE `donhang` ADD CONSTRAINT `donhang_maKH_PK` FOREIGN KEY (`maKH`) REFERENCES `khachhang` (`MaKh`);

-- Cấu trúc bảng cho bảng `chude`

CREATE TABLE `chude` (
  `MaChuDe` varchar(50) NOT NULL,
  `TenChuDe` varchar(50) NOT NULL
);
ALTER TABLE `chude` ADD PRIMARY KEY (`MaChuDe`);

-- Cấu trúc bảng cho bảng `nhaxuatban`

CREATE TABLE `nhaxuatban` (
  `MaNSX` varchar(50) NOT NULL,
  `TenNSB` varchar(50) NOT NULL,
  `DiaChi` varchar(50) NOT NULL,
  `DienThoai` varchar(50) NOT NULL
);
ALTER TABLE `nhaxuatban` ADD PRIMARY KEY (`MaNSX`);
-- Cấu trúc bảng cho bảng `sach`

CREATE TABLE `sach` (
  `MaSach` varchar(50) NOT NULL,
  `TenSach` varchar(50) NOT NULL,
  `SoLuongTon` int(11) NOT NULL,
  `NgayCapNhap` datetime NOT NULL,
  `AnhBia` varchar(50) NOT NULL,
  `MoTa` varchar(50) NOT NULL,
  `GiaBan` int(11) NOT NULL,
  `MaChuDe` varchar(50) NOT NULL,
  `MaNSX` varchar(50) NOT NULL
);
ALTER TABLE `sach` ADD PRIMARY KEY (`MaSach`);
ALTER TABLE `sach` ADD CONSTRAINT `sach_MaNSX_PK` FOREIGN KEY (`MaNSX`) REFERENCES `nhaxuatban` (`MaNSX`);
ALTER TABLE `sach` ADD CONSTRAINT `sach_MaChuDe_PK` FOREIGN KEY (`MaChuDe`) REFERENCES `chude` (`MaChuDe`);

-- Cấu trúc bảng cho bảng `tacgia`

CREATE TABLE `tacgia` (
  `MaTacGia` varchar(50) NOT NULL,
  `TenTacGia` varchar(50) NOT NULL,
  `DiaChi` varchar(50) NOT NULL,
  `TieuSu` varchar(50) NOT NULL,
  `DienThoai` varchar(50) NOT NULL
);
ALTER TABLE `tacgia` ADD PRIMARY KEY (`MaTacGia`);

-- Cấu trúc bảng cho bảng `donhang_sach`

CREATE TABLE `donhang_sach` (
  `MaDonHang` varchar(50) NOT NULL,
  `MaSach` varchar(50) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `DonGia` int(11) NOT NULL
); 
ALTER TABLE `donhang_sach` ADD PRIMARY KEY (`MaDonHang`,`MaSach`);
ALTER TABLE `donhang_sach` ADD CONSTRAINT `donhang_sach_MaDonHang_PK` FOREIGN KEY (`MaDonHang`) REFERENCES `donhang` (`MaDonHang`);
ALTER TABLE `donhang_sach` ADD CONSTRAINT `donhang_sach_MaSach_PK` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`);
-- Cấu trúc bảng cho bảng `tacgia_sach`

CREATE TABLE `tacgia_sach` (
  `MaTacGia` varchar(50) NOT NULL,
  `MaSach` varchar(50) NOT NULL,
  `VaiTro` varchar(50) NOT NULL,
  `ViTri` varchar(50) NOT NULL
); 
ALTER TABLE `tacgia_sach` ADD PRIMARY KEY (`MaTacGia`,`MaSach`)
ALTER TABLE `tacgia_sach` ADD CONSTRAINT `tacgia_MaSach_pk` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`);
ALTER TABLE `tacgia_sach` ADD CONSTRAINT `tacgia_MaTacGia_PK` FOREIGN KEY (`MaTacGia`) REFERENCES `tacgia` (`MaTacGia`);