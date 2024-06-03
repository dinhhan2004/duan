<?php

require '../../global.php';
require '../../dao/hang-hoa.php';
require '../../dao/khach-hang.php';
require '../../dao/don_hang.php';
// session_start(); // Bắt đầu session

//-------------------------------//
extract($_REQUEST);

if (exist_param("form_invoice")) {
    if (isset($_SESSION['user'])) {
        $id = $_SESSION['user'];
        $kh = khach_hang_select_by_id($id['ma_kh']);
        extract($kh);

        // Chọn ra sản phẩm từ giỏ hàng để hiển thị trong trang thanh toán
        if (isset($_SESSION['cart'])) {
            $cartItems = [];
            foreach ($_SESSION['cart'] as $index => $item) {
                $hangHoa = hang_hoa_select_by_id($index);
                $item['ten_hh'] = $hangHoa['ten_hh'];
                $cartItems[] = $item;
            }

            // Lấy danh sách phương thức thanh toán từ cơ sở dữ liệu
            $paymentMethods = phuong_thuc_select();

            $_SESSION['paymentMethods'] = $paymentMethods;

            $VIEW_NAME = "../cart/form-invoice.php";
        } else {
            // Giỏ hàng trống
            $VIEW_NAME = "../cart/cart.php";
        }
    } else {
        // Chưa đăng nhập, chuyển hướng đến trang đăng nhập
        header("location:" . $SITE_URL . "/tai-khoan/dang-nhap.php");
    }
} else {
    // Trang giỏ hàng
    $VIEW_NAME = "../cart/cart.php";
}

// Bạn có thể thêm các công việc khác ở đây nếu cần

// if (isset($_SESSION['totalAll'])) {
//     echo "Tổng cộng: " . $_SESSION['totalAll'];
// }

require '../layout.php';
