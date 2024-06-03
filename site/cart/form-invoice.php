<h5 class="alert-secondary mb-3 pt-3 pb-3 pl-sm-4 shadow-sm text-center text-sm-center text-md-center text-lg-center text-xl-center"
    style="margin-top: 5rem; margin-bottom: 0rem">Thông tin nhận hàng </h5>
<div class="row m-1 pb-5">
    <form action="invoice.php" method="POST" class="col-6 m-auto" id="invoice" enctype="multipart/form-data">
        <div class="form-group">
            <input type="hidden" name="ma_dh" id="ma_dh" class="form-control rounded-pill" value="<?= $ma_hd ?>"
                aria-describedby="helpId">
        </div>
        <div class="form-group form">
            <label for="ho_ten">Họ và tên</label>
            <input type="text" name="ho_ten" id="ho_ten" class="form-control rounded-pill" value="<?= $ho_ten ?>"
                aria-describedby="helpId">
        </div>
        <div class="form-group">
            <input type="hidden" name="ma_kh" id="ma_kh" class="form-control rounded-pill" value="<?= $ma_kh ?>"
                aria-describedby="helpId">
        </div>

        <?php
        $totalAll = 0;
        if (!empty($cartItems) && is_array($cartItems)) {
            foreach ($cartItems as $item) {
                $thanhTien = $item['don_gia'] * $item['sl'];
                $totalAll += $thanhTien;
                ?>
                <div class="form-group">
                    <label for="ten_san_pham">Tên sản phẩm</label>
                    <input type="text" name="ten_san_pham" id="ten_san_pham" class="form-control rounded-pill" value="<?= $item['ten_hh'] ?>"
                        aria-describedby="helpId" readonly>
                </div>
                <div class="form-group">
            <label for="tong_cong">Số lượng</label>
            <input type="text" name="so_luong" id="so_luong" class="form-control rounded-pill" value="<?= $item['sl'] ?> "
                aria-describedby="helpId" readonly>
        </div>
                <?php
            }
        } else {
            echo "Không có sản phẩm trong giỏ hàng.";
        }
        ?>

   

        <div class="form-group">
            <label for="tong_cong">Tổng cộng</label>
            <input type="text" name="tong_cong" id="tong_cong" class="form-control rounded-pill" value="<?= $totalAll ?> đ"
                aria-describedby="helpId" readonly>
        </div>

        <div class="form-group">
            <label for="email">Địa chỉ email</label>
            <input type="text" name="email" id="email" class="form-control rounded-pill" value="<?= $email ?>"
                aria-describedby="helpId">
        </div>
        <div class="form-group">
            <label for="sdt">Số điện thoại</label>
            <input type="text" name="sdt" id="sdt" class="form-control rounded-pill" placeholder=""
                aria-describedby="helpId">
        </div>
        <div class="form-group">
            <label for="dia_chi">Địa chỉ nhận hàng</label>
            <input type="text" name="dia_chi" id="dia_chi" class="form-control rounded-pill" placeholder=""
                aria-describedby="helpId">
        </div>
        <div class="form-group">
            <label for="phuong_thuc_tt">Phương thức thanh toán</label>
            <br>
            <select name="phuong_thuc_thanh_toan" id="phuong_thuc_tt" class="form-control">
                <?php
                // $paymentMethods là biến chứa danh sách phương thức thanh toán từ session
                foreach ($paymentMethods as $method) {
                    echo "<option value='" . $method['id_phuong_thuc'] . "'>" . $method['ten_phuong_thuc'] . "</option>";
                }
                ?>
            </select>
        </div>

        <div class="form-group">
    <label for="ngay_thang">Ngày đặt hàng</label>
    <input type="text" name="ngay_dat" id="ngay_thang" class="form-control rounded-pill" value="<?= date('Y-m-d H:i:s') ?>" aria-describedby="helpId" readonly>
</div>

        <!--input type="hidden" name="trang_thai" value="0">
        <div class="form-group">
            <label for="ghi_chu">Ghi chú</label>
            <textarea name="ghi_chu" id="ghi_chu" class="form-control"></textarea>
        </div!-->
        <div class="d-flex justify-content-center">
            <button type="submit" name="btn_thanh_toan" class="btn btn-success btn-block pt-2 pb-2 rounded-pill">Xác nhận</button>
        </div>
    </form>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const invoiceForm = document.getElementById('invoice');

        invoiceForm.addEventListener('submit', function (event) {
            let errors = [];

            // Validate Họ và tên
            const hoTenInput = document.getElementById('ho_ten');
            if (hoTenInput.value.trim() === '') {
                errors.push('Họ và tên không được để trống');
            }

            // Validate Địa chỉ email
            const emailInput = document.getElementById('email');
            if (emailInput.value.trim() === '' || !isValidEmail(emailInput.value.trim())) {
                errors.push('Địa chỉ email không hợp lệ');
            }

            // Validate Số điện thoại
            const sdtInput = document.getElementById('sdt');
            if (sdtInput.value.trim() === '' || !isValidPhoneNumber(sdtInput.value.trim())) {
                errors.push('Số điện thoại không hợp lệ');
            }

            // Validate Địa chỉ nhận hàng
            const diaChiInput = document.getElementById('dia_chi');
            if (diaChiInput.value.trim() === '') {
                errors.push('Địa chỉ nhận hàng không được để trống');
            }

            // Display errors if any
            if (errors.length > 0) {
                event.preventDefault(); // Prevent form submission
                alert(errors.join('\n'));
            }
        });

        // Helper function to validate email
        function isValidEmail(email) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        }

        // Helper function to validate phone number
        function isValidPhoneNumber(phoneNumber) {
            const phoneRegex = /^[0-9]{10,}$/; // Assumes a basic format for simplicity
            return phoneRegex.test(phoneNumber);
        }
    });
</script>

