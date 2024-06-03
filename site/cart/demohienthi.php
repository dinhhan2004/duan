<div class="form-group">
    <label for="phuong_thuc_tt">Phương thức thanh toán</label>
    <br>
    <select name="phuong_thuc_tt" id="phuong_thuc_tt" class="form-control">
    <?php
        require '../../dao/pdo.php';
        require '../../global.php';

        extract($_REQUEST);
        // Thực hiện truy vấn SQL để lấy các lựa chọn từ MySQL
        $query = "SELECT * FROM phuongthuc";
        $result = pdo_query($query);

        // Lặp qua kết quả và tạo các thẻ option
        // while ($row = pdo_fetch_assoc($result)) {
        //     $selected = ($row['id_phuong_thuc'] == $phuong_thuc_tt) ? 'selected' : '';
        //     echo "<option value='{$row['id_phuong_thuc']}' $selected>{$row['ten_phuong_thuc']}</option>";
        // }


        foreach($result as $item){
            $selected = ($item['id_phuong_thuc'] == $phuong_thuc_tt) ? 'selected' : '';
            echo "<option value='{$item['id_phuong_thuc']}' $selected>{$item['ten_phuong_thuc']}</option>";
        }
        ?>
    </select>
    </div>