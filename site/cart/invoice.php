<?php
// require '../../global.php';
// require '../../dao/don_hang.php';

// extract($_REQUEST);
// $VIEW_NAME = "cart/form-invoice.php";

// if(exist_param("btn_thanh_toan")){
//     $add_don_hang =  insert_hoa_don($ho_ten, $email, $sdt, $dia_chi, $phuong_thuc_tt, $ghi_chu);
//     global $ho_ten,$email,$sdt,$dia_chi,$phuong_thuc_tt,$ghi_chu;
//     if($add_don_hang){
//         echo '<script>
//         alert("Đã đặt hàng thành công");
//     </script>';
//     }
//     else{
//         echo"La làng";
//     }
// }

// require '../layout.php';



require '../../global.php';
require '../../dao/don_hang.php';

// Trích xuất các tham số từ yêu cầu
extract($_POST);

// Đặt tên view
$VIEW_NAME = "cart/form-invoice.php";

// $ngay_dat = date('Y-m-d H:i:s');

// Kiểm tra nút "btn_thanh_toan" có được nhấn không
if (exist_param("btn_thanh_toan")) {
    // Thực hiện thêm đơn hàng bằng cách sử dụng hàm dao
    $add_don_hang =  insert_hoa_don($ma_dh,$ho_ten,$ten_san_pham,$so_luong,$tong_cong,$ngay_dat, $ma_kh,$dia_chi,$sdt,$phuong_thuc_thanh_toan);
    
    // global $ma_dh,$ho_ten, $ten_san_pham,$tong_cong,  $email, $sdt, $dia_chi, $phuong_thuc_tt, $ghi_chu;

    // Kiểm tra xem đơn hàng đã được thêm thành công hay không
    // if ($add_don_hang) {
    //     echo '<script>alert("Đặt hàng thất bại. Vui lòng thử lại sau.");</script>';
    // } else {
    //     echo '<script>alert("Đã đặt hàng thành công");</script>';
    // }

    if ($add_don_hang) {
        echo '<script>alert("Đã đặt hàng thành công");</script>';
    } else {
        echo '<script>alert("Đã đặt hàng thành công");</script>';'<script>alert("Đặt hàng thất bại. Vui lòng thử lại sau.");</script>';
    }
}

// Bao gồm tệp layout
require '../layout.php';




