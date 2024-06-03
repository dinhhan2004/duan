-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 08, 2023 lúc 09:48 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `da1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binh_luan`
--

CREATE TABLE `binh_luan` (
  `ma_bl` int(11) NOT NULL,
  `noi_dung` varchar(255) NOT NULL,
  `ma_hh` int(11) NOT NULL,
  `ma_kh` varchar(20) NOT NULL,
  `ngay_bl` date NOT NULL,
  `rating` tinyint(5) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `binh_luan`
--

INSERT INTO `binh_luan` (`ma_bl`, `noi_dung`, `ma_hh`, `ma_kh`, `ngay_bl`, `rating`) VALUES
(47, 'lo', 55, 'thayho', '2023-11-29', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_hd`
--

CREATE TABLE `chi_tiet_hd` (
  `ma_cthd` int(11) NOT NULL,
  `ma_hh` int(11) NOT NULL,
  `don_gia` int(11) NOT NULL,
  `thanh_gia` int(11) NOT NULL,
  `ma_hd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hang_hoa`
--

CREATE TABLE `hang_hoa` (
  `ma_hh` int(11) NOT NULL,
  `ten_hh` varchar(50) NOT NULL,
  `don_gia` int(11) NOT NULL,
  `giam_gia` int(11) DEFAULT 0,
  `hinh` varchar(50) NOT NULL,
  `ngay_nhap` date DEFAULT NULL,
  `mo_ta` text NOT NULL,
  `dac_biet` int(1) NOT NULL DEFAULT 0,
  `so_luot_xem` int(11) NOT NULL DEFAULT 0,
  `ma_loai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hang_hoa`
--

INSERT INTO `hang_hoa` (`ma_hh`, `ten_hh`, `don_gia`, `giam_gia`, `hinh`, `ngay_nhap`, `mo_ta`, `dac_biet`, `so_luot_xem`, `ma_loai`) VALUES
(39, 'Whey Protein', 2500000, 500000, 'WPC_Front.png', '2023-11-24', 'Là loại whey protein chứa một phần protein tương đối cao (từ 70% đến 80%), cùng với một lượng nhỏ chất béo và carbohydrate từ sữa.\r\nGiữ lại nhiều dạng chất dinh dưỡng so với các loại whey khác.\r\nThường có giá rẻ hơn so với các loại whey protein cao cấp khác.', 0, 5, 17),
(42, 'VitalStrength WPI Plus 100 Whey Protein Isolate 1K', 1475000, 200000, 'hinh2.jpg', '2023-11-24', 'Vital Strength’s 100% WPI + Whey Protein Isolate là một trong những nguồn protein sạch nhất hiện nay. Các quy trình siêu lọc và siêu nhỏ sẽ giúp loại bỏ chất béo, đường lactose và các tạp chất khác để cung cấp một loại protein có hàm lượng calo thấp, dễ tiêu hóa và hấp thụ nhanh chóng.', 0, 0, 17),
(43, 'Bột Protein Musashi Plant Protein thực vật Vị SOCO', 1105000, 100000, 'hinh1.webp', '2023-11-24', 'MUSASHI PLANT PROTEIN là một hỗn hợp siêu cao cấp chứa sự kết hợp hiệp đồng giữa hạt đậu, gạo lứt và protein hạt chia. Công thức thân thiện với người thuần chay này hoạt động như một nguồn protein thực vật cuối cùng để đáp ứng nhu cầu của các vận động viên muốn tối đa hóa cơ nạc và tối ưu hóa khả năng phục hồi. Công thức có hàm lượng carbohydrate thấp tiên tiến này được thiết kế một cách khoa học để hỗ trợ nhu cầu dinh dưỡng thể thao của bạn trong một công thức thơm ngon, có hương vị tuyệt vời và dễ dàng trộn lẫn với dinh dưỡng thể thao đáng tin cậy\r\nCông bố về sản phẩm: ĐỂ TĂNG TRƯỞNG VÀ SỬA CHỮA NẤM *, HOÀN THÀNH HỒ SƠ AXIT AMINO, PEA, GẠO NÂU VÀ CHIA PROTEIN', 0, 1, 17),
(44, 'Whey Protein 4.4lbs (2kg)', 1300000, 271000, 'hinh3.jpg', '2023-11-28', '\r\nWarrior Whey là một tân binh mới đến từ xứ sở Anh Quốc, hiện tại cũng được rất nhiều bạn trẻ trong giới thể thao biết đến với hương vị cực kì tuyệt vời, ngoài ra sản phẩm còn mang đến một lượng đạm lớn và cực tinh khiết.\r\nMỗi lần dùng 25g sản phẩm chứa 18g protein, giúp đáp ứng nhu cầu protein hàng ngày. Sản phẩm cũng hỗ trợ cho sự phục hồi nhanh chóng của các vết rách vi mô trong cơ thể sau khi tập luyện, giúp giảm đau và tăng cường sức mạnh và kích thước cơ bắp theo thời gian.', 1, 3, 17),
(45, '  Rule1 Protein 5lbs (2.3kg)', 2200000, 342000, 'hinh4.webp', '2023-11-28', 'Rule 1 R1 Protein được làm từ nguồn nguyên liệu chất lượng cao, chủ yếu là Whey Protein Isolate và Protein Hydrolyzed, giúp tăng cường khả năng hấp thu của cơ thể.\r\n', 0, 0, 17),
(46, ' Iso HD 5lbs (2.3kg)', 1700000, 150000, 'hinh5.webp', '2023-11-28', 'BPI Sport Iso HD đã cam kết mang lại cho bạn những sản phẩm dinh dưỡng thể thao chất lượng cao nhất tuyệt đối. Nhưng bây giờ sản phẩm của chúng tôi không phải chỉ đến từ những lời giới thiệu.\r\nHọ đã đặt tất cả các sản phẩm protein của họ thông qua thử nghiệm nghiêm ngặt bởi ChromaDex®, một phòng thí nghiệm của bên thứ ba, và là một trong những cái tên được kính trọng nhất trong nền dinh dưỡng thể thao Hoa Kỳ. Các dấu ChromaDex® - Chất lượng được xác minh, có nghĩa là không có protein \"vô nghĩa\" và khẳng định rằng sản phẩm đáp ứng đặc điểm kỹ thuật cho sắc tố, không chất gây ô nhiễm, các kim loại nặng và vi sinh vật. Nó là bằng chứng khách quan rằng các protein của chúng tôi đủ tiêu chuẩn cGMP (Quá trình sản xuất tốt nhất) và những gì bạn thấy được liệt kê trong thành phần của chúng tôi là chính xác những gì có trong các sản phẩm.', 1, 7, 17),
(47, ' The Original Mutant Mass 15lbs (6.8kg)', 1950000, 270000, 'hinh6.webp', '2023-11-28', 'Mutant Mass 15Lbs được biết đến với chức năng hỗ trợ lượng protein cao cấp dành cho những người gầy. Nó giúp bổ sung năng lượng để tăng cân và phát triển cơ bắp một cách nhanh chóng, điều này đã thu hút sự quan tâm của đa số người tập luyện khi sản phẩm ra mắt.\r\nNgoài ra, Mutant Mass 15Lbs còn chứa lượng peptic xương và axit amin tự do giúp cơ thể dễ dàng tiêu hóa hợp chất Hydrat cacbon và đường fructose, tạo ra chương trình dinh dưỡng căn bản cho người dùng.', 1, 10, 17),
(48, 'Nitro Tech 4lbs', 1670000, 0, 'hinh7.webp', '2023-11-28', 'Nitro Tech 4lbs là dòng sữa tăng cơ có chứa nhiều chất protein dành cho các một số người muốn phát triển cơ bắp, vận động viên thể hình. Những chất protein của Nitro Tech đến từ whey peptides và whey Isolate, đây là những nguồn protein tinh khiết và tốt nhất đối với người sử dụng.\r\n\r\nVà khi một ai đó muốn tăng cơ bắp thì đều nghĩ ngay đến sữa tăng cơ Nitro Tech 5lbs. Loại sữa tăng cơ này tất nhiên sẽ có điểm vượt trội so với những dòng sữa khác cùng loại, một số những ưu điểm khác đó là tăng cường thêm 3g creatine monohydrate.\r\n\r\nNhững loại protein này sẽ làm cho cơ bắp của người sử dụng được khỏe khoắn hơn, kích thích tốt hơn, phát triển tốt hơn khi bạn dùng loại sữa này. Khi uống những loại sữa bổ sung protein cho cơ bắp thì cũng sẽ tăng cường thêm sức mạnh cho cơ thể.\r\n\r\nCó thể bạn chưa biết trong Nitro Tech có 3 loại amino acid đó là Taurine, Alanine và Glycine. Mỗi loại đều có ưu điểm đối với sức khỏe của người dùng sữa. Taurine là loại amino acid giúp cho tăng kích thước cho tế bào.', 0, 0, 17),
(49, ' Iso Pro 8lbs (3.6kg)', 2700000, 150000, 'hinh8.webp', '2023-11-28', '', 0, 0, 17),
(50, 'Ostrovit Whey Protein Isolate (700g)', 560000, 0, 'hinh9.webp', '2023-11-28', 'Ostrovit Whey Protein Isolate với 100% Whey Isolate tinh khiết hỗ trợ phục hồi, phát trượt cơ bắp vượt trội. Ostrovit Whey Protein Isolate nhập khẩu chính hãng, cam kết giá rẻ tốt nhất Hà Nội TpHCM', 1, 0, 18),
(51, 'Nutricost Grass Fed Whey Protein Isolate 5Lbs', 1980000, 0, 'hinh10.png', '2023-11-28', 'Grass Feb Whey Protein Isolate có hàm lượng protein là thành phần dưỡng chất không thể thiếu trong cơ thể. Theo thời gian, lượng protein sẽ dần mất đi và khó thể tái tạo được. Do đó, cơ thể cần được bổ sung lượng Protein bị thiếu hụt qua các thực phẩm hỗ trợ. Sản phẩm Nutricost Grass Fed Whey Protein Isolate 5Lbs cung cấp lượng protein sạch cùng các dưỡng chất có lợi cho thể như Creatine, Omega-3,.... Sản phẩm Nutricost Grass Whey Protein Isolate được kiểm duyệt chặt chẽ về chất lượng. Vậy nên bạn hoàn toàn có thể yên tâm khi sử dụng sản phẩm này.', 1, 0, 18),
(52, 'Applied Nutrition 100% Casein 1.8kg', 1450000, 50000, 'hinh11.jpg', '2023-11-28', '', 1, 0, 18),
(53, 'AMIX GOLD ISOLATE WHEY PROTEIN 5LBS', 1550000, 70000, 'hinh13.jpg', '2023-11-28', 'CÔNG DỤNG SẢN PHẨM: AMIX GOLD ISOLATE WHEY PROTEIN 5LBS Amix Gold Isolate là một sản phẩm Whey Protein với nguồn Protein từ 100% Whey Protein Isolate.\r\n Ngoài ra, sản phẩm còn cung cấp một số những ưu điểm nổi bật ví dụ như hàm lượng Leucine, Glutamine cao đồng thời đi kèm với những công nghệ đặc biệt: \r\n• Cung cấp một hàm lượng lớn Protein trong mỗi Serving lên tới 27g với tỷ lệ 90% trong 30g bột \r\n• Nguồn Protein siêu tinh khiết hỗ trợ phục hồi và phát triển cơ bắp ', 0, 0, 18),
(54, '100% Whey Protein Isolate 2kg', 2000000, 100000, 'hinh12.jpg', '2023-11-28', 'Scitec Nutrition 100% Whey Protein Isolate là sự kết hợp của 2 dòng Whey phổ biến trên thị trường.Theo thời gian, khả năng tổng hợp Protein của cơ thể càng suy giảm. Việc bổ sung nguồn đạm bị thiếu hụt là vô cùng cần thiết. Đặc biệt đối với người tập thể hình, Whey Protein là thực phẩm giúp hỗ trợ quá trình xây dựng cơ bắp diễn ra hiệu quả. Hiện nay, có 2 dòng Whey Protein được ưa chuộng. Đó là Isolate và Hydrolyzed. Cả hai đều đảm bảo cung cấp cho bạn nguồn Protein tinh khiết và không pha trộn. nói trên. Nhờ đó, hỗ trợ tối ưu hiệu quả luyện tập, xây dựng cơ bắp của bạn. ', 1, 0, 18),
(55, 'ISO 100 WHEY PROTEIN 5LBS', 2250000, 150000, 'hinh14.jpg', '2023-11-28', 'Thông Tin Sản PhẩmNhu cầu cung cấp whey protein isolate là thiết yếu, và hầu hết các chuyên gia dinh dưỡng và những người chơi thể thao sau khi dùng Dymatize Iso 100 đều nhận định rằng Iso 100 mang lại mùi vị, và hiệu quả thật khác biệt. Với công nghệ...', 1, 4, 18),
(56, 'Whey Protein Beyond Isolate 5lbs', 1980000, 170000, 'hinh15.jpg', '2023-11-28', '1 hộp Whey Protein Beyond Isolate chứa 5lbs (2,3kg).\r\nMỗi hộp có 75 lần dùng.\r\nMột muỗng 30g cho đến 26g protein.\r\nSử dụng chất tạo ngọt từ tự nhiên đến từ cỏ Stevia.\r\nSữa được lấy từ bò chăn thả tự nhiên không tiêm hormone tăng trưởng.\r\n1,950', 1, 0, 18),
(57, 'ON Platinum Hydrowhey, 3.5 Lbs (1.59 kg)', 1610000, 95000, 'hinh16.webp', '2023-11-28', 'ON Platinum Hydrowhey là dòng Whey Protein nổi tiếng của Optimum Nutrition. Sản phẩm cung cấp 100% whey thuỷ phân cao cấp và hấp thu nhanh nhất giúp tăng tốc độ phục hồi, phát triển cơ bắp lên ngưỡng tối đa. \r\n\r\n ', 1, 0, 19),
(58, 'BioTechUSA Hydro Whey Zero, 4 Lbs (1,816 Kg)', 1990000, 90000, 'hinh17.webp', '2023-11-28', 'Whey Hydrolyzed & Whey Isolate\r\n\r\nNguyên liệu cao cấp từ sữa của những con bò được chăn thả tự nhiên\r\n\r\n18g protein\r\n\r\n3.7g BCAA, 7.5g EAA, 4g Glutamine\r\n\r\nChỉ 85 calo/serving\r\n\r\nPhù hợp với người không dung nạp lactose, gluten\r\n\r\nKhông gây nổi mụn', 1, 1, 19),
(59, 'Nutrabolics Hydropure 4.5 Lbs, 58 Servings', 2050000, 300000, 'hinh18.webp', '2023-11-28', '100% Hydrolyzed Whey Protein\r\n28g Protein\r\n13g EAA, 6.1g BCAA, 5g Glutamine\r\nKhông chứa Lactose, Gluten\r\nĐạt chứng chỉ HACCP, GMP, ISO, HALAL', 1, 0, 19);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoa_don`
--

CREATE TABLE `hoa_don` (
  `ma_hd` int(11) NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `ten_san_pham` varchar(255) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `tong_tien` float NOT NULL,
  `ngay_dat` datetime NOT NULL,
  `ma_kh` varchar(255) NOT NULL,
  `dia_chi` varchar(255) NOT NULL,
  `sdt` varchar(255) NOT NULL,
  `phuong_thuc_thanh_toan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hoa_don`
--

INSERT INTO `hoa_don` (`ma_hd`, `ho_ten`, `ten_san_pham`, `so_luong`, `tong_tien`, `ngay_dat`, `ma_kh`, `dia_chi`, `sdt`, `phuong_thuc_thanh_toan`) VALUES
(1, 'T1 Faker', 'Ostrovit Whey Protein Isolate (700g)', 2, 1120000, '0000-00-00 00:00:00', '0', 'adasdasdasd', '0123456789', 2),
(2, 'T1 Faker', 'Ostrovit Whey Protein Isolate (700g)', 2, 1120000, '0000-00-00 00:00:00', '0', 'dgfgdgdfg', '456346345636', 1),
(3, 'faker', 'dasdasdasdasdadasd', 3, 3333330000000, '2023-12-05 16:28:51', '1', 'ấdasdas', '2355235235', 1),
(4, 'T1 Faker', 'Ostrovit Whey Protein Isolate (700g)', 2, 1120000, '2023-12-05 16:39:36', 't1 faker', 'sfdsfsdf', '523452352', 1),
(5, 'T1 Faker', 'Ostrovit Whey Protein Isolate (700g)', 2, 1120000, '2023-12-05 16:45:33', 't1 faker', 'sfdsfsdf', '523452352', 1),
(6, 'T1 Faker', 'Ostrovit Whey Protein Isolate (700g)', 2, 1120000, '2023-12-05 16:46:12', 't1 faker', 'sdfsdfs', '34534535', 1),
(7, 'T1 Faker', 'Ostrovit Whey Protein Isolate (700g)', 2, 1120000, '2023-12-05 16:46:12', 't1 faker', 'sdfsdfs', '34534535', 1),
(8, 'T1 Faker', 'Ostrovit Whey Protein Isolate (700g)', 2, 1120000, '2023-12-05 16:47:22', 't1 faker', 'sdfsdfs', '34534535', 1),
(9, 'T1 Faker', 'Ostrovit Whey Protein Isolate (700g)', 2, 1120000, '2023-12-05 16:50:32', 't1 faker', 'dfsdfs', '2342343', 1),
(10, 'T1 Faker', 'Ostrovit Whey Protein Isolate (700g)', 2, 1120000, '2023-12-05 16:55:41', 't1 faker', 'dfsdfs', '2342343', 1),
(11, 'Lee Sanghyeok', ' Iso HD 5lbs (2.3kg)', 1, 1700000, '2023-12-06 07:03:51', 't1 faker', '', '234324234234', 1),
(12, 'T1 Faker', ' Iso HD 5lbs (2.3kg)', 1, 1700000, '2023-12-06 07:05:15', 't1 faker', 'nfdjf', '3234242', 1),
(13, 'dAT 5 PHIT', ' Iso HD 5lbs (2.3kg)', 2, 3400000, '2023-12-08 06:38:15', 't1 faker', 'sfdsfsdf', '0123456789', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khach_hang`
--

CREATE TABLE `khach_hang` (
  `ma_kh` varchar(20) NOT NULL COMMENT 'mã đăng nhập',
  `mat_khau` varchar(50) NOT NULL COMMENT 'mật khẩu',
  `ho_ten` varchar(50) NOT NULL COMMENT 'họ tên',
  `kich_hoat` bit(1) NOT NULL DEFAULT b'0' COMMENT 'trạng thái kích hoạt',
  `hinh` varchar(255) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `vai_tro` bit(1) NOT NULL DEFAULT b'0' COMMENT 'vai trò true là nv'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khach_hang`
--

INSERT INTO `khach_hang` (`ma_kh`, `mat_khau`, `ho_ten`, `kich_hoat`, `hinh`, `email`, `vai_tro`) VALUES
('admin', '123456', 'Hiếu Minh', b'1', 'HIEU.jpg', 'hieuminh@gmail.com', b'1'),
('chipheo', '123456', 'Chí Phèo', b'1', 'chipheo.png', 'pheochi@gmail.com', b'0'),
('hieuminh2', '123456', 'Nguyễn Minh Hiếu', b'1', '', 'hieu2@gmail.com', b'0'),
('huanhoanhai', '123456', 'Thầy Huấn Hoa Nhài', b'1', 'huan-hoa-hong-xanh-le-noi-oi-doi-oi.jpeg', 'huanhoanhai@gmail.com', b'0'),
('khanhsky', '123456', 'Khánh Sky', b'1', 'khanhsky.jpg', 'khanhsky@gmail.com', b'0'),
('locfuho', '123456', 'Thầy Lộc FUHO', b'1', 'Loc-Fuho-la-ai.jpg', 'locfuho@gmail.com', b'0'),
('t1 faker', 'gggg1111', 'T1 Faker', b'1', 'lmht-faker-1.jpg', 'datdDNTD@gmail.com', b'1'),
('thayho', '123456', 'Nguyễn Gia Nghĩa', b'1', 'IMG_20210221_175655.jpg', 'hotb@gmail.com', b'1'),
('thino', '123456', 'Thị Nở', b'1', 'tn.jpg', 'thino@gmail.com', b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai`
--

CREATE TABLE `loai` (
  `ma_loai` int(11) NOT NULL COMMENT 'mã loại hàng',
  `ten_loai` varchar(50) NOT NULL COMMENT 'tên loại hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loai`
--

INSERT INTO `loai` (`ma_loai`, `ten_loai`) VALUES
(17, 'Whey Protein'),
(18, 'Whey Protein Isolate'),
(19, 'Whey Protein Hydrolysate'),
(21, 'Dụng cụ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phuongthuc`
--

CREATE TABLE `phuongthuc` (
  `id_phuong_thuc` int(11) NOT NULL,
  `ten_phuong_thuc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phuongthuc`
--

INSERT INTO `phuongthuc` (`id_phuong_thuc`, `ten_phuong_thuc`) VALUES
(1, 'Tiền mặt'),
(2, 'Ví điện tử');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  ADD PRIMARY KEY (`ma_bl`),
  ADD KEY `binh_luan_ibfk_1` (`ma_hh`),
  ADD KEY `binh_luan_ibfk_2` (`ma_kh`);

--
-- Chỉ mục cho bảng `chi_tiet_hd`
--
ALTER TABLE `chi_tiet_hd`
  ADD PRIMARY KEY (`ma_cthd`),
  ADD KEY `ma_hd` (`ma_hd`),
  ADD KEY `ma_hh` (`ma_hh`);

--
-- Chỉ mục cho bảng `hang_hoa`
--
ALTER TABLE `hang_hoa`
  ADD PRIMARY KEY (`ma_hh`),
  ADD KEY `ma_loai` (`ma_loai`);

--
-- Chỉ mục cho bảng `hoa_don`
--
ALTER TABLE `hoa_don`
  ADD PRIMARY KEY (`ma_hd`),
  ADD KEY `phuong_thuc_thanh_toan` (`phuong_thuc_thanh_toan`);

--
-- Chỉ mục cho bảng `khach_hang`
--
ALTER TABLE `khach_hang`
  ADD PRIMARY KEY (`ma_kh`);

--
-- Chỉ mục cho bảng `loai`
--
ALTER TABLE `loai`
  ADD PRIMARY KEY (`ma_loai`);

--
-- Chỉ mục cho bảng `phuongthuc`
--
ALTER TABLE `phuongthuc`
  ADD PRIMARY KEY (`id_phuong_thuc`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  MODIFY `ma_bl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_hd`
--
ALTER TABLE `chi_tiet_hd`
  MODIFY `ma_cthd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hang_hoa`
--
ALTER TABLE `hang_hoa`
  MODIFY `ma_hh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT cho bảng `hoa_don`
--
ALTER TABLE `hoa_don`
  MODIFY `ma_hd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `loai`
--
ALTER TABLE `loai`
  MODIFY `ma_loai` int(11) NOT NULL AUTO_INCREMENT COMMENT 'mã loại hàng', AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `phuongthuc`
--
ALTER TABLE `phuongthuc`
  MODIFY `id_phuong_thuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  ADD CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`ma_hh`) REFERENCES `hang_hoa` (`ma_hh`) ON DELETE CASCADE,
  ADD CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`ma_kh`) REFERENCES `khach_hang` (`ma_kh`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `chi_tiet_hd`
--
ALTER TABLE `chi_tiet_hd`
  ADD CONSTRAINT `chi_tiet_hd_ibfk_1` FOREIGN KEY (`ma_hd`) REFERENCES `hoa_don` (`ma_hd`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chi_tiet_hd_ibfk_2` FOREIGN KEY (`ma_hh`) REFERENCES `hang_hoa` (`ma_hh`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `hang_hoa`
--
ALTER TABLE `hang_hoa`
  ADD CONSTRAINT `hang_hoa_ibfk_1` FOREIGN KEY (`ma_loai`) REFERENCES `loai` (`ma_loai`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hoa_don`
--
ALTER TABLE `hoa_don`
  ADD CONSTRAINT `hoa_don_ibfk_1` FOREIGN KEY (`phuong_thuc_thanh_toan`) REFERENCES `phuongthuc` (`id_phuong_thuc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
