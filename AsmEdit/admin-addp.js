// admin-addp.js

function addProduct(event) {
    event.preventDefault(); // Ngăn chặn việc gửi biểu mẫu mặc định

    // Lấy thông tin từ biểu mẫu
    const productName = document.querySelector('input[name="prd_name"]').value;
    const productPrice = document.querySelector('input[name="prd_price"]').value;
    const productImage = document.querySelector('input[name="prd_image"]').files[0];

    // Kiểm tra xem có dữ liệu nhập vào không
    if (productName && productPrice && productImage) {
        // Tạo một đối tượng FormData để gửi dữ liệu hình ảnh
        const formData = new FormData();
        formData.append('prd_name', productName);
        formData.append('prd_price', productPrice);
        formData.append('prd_image', productImage);

        // Gửi yêu cầu POST để thêm sản phẩm mới
        fetch('db.json', {
            method: 'GET'
        })
        .then(response => response.json())
        .then(data => {
            const products = data.product;
            const newProductId = products.length + 1; // Tạo ID mới cho sản phẩm

            // Tạo đối tượng sản phẩm mới
            const newProduct = {
                id: newProductId,
                name: productName,
                image: 'img/sp' + newProductId + '.jpg', // Đảm bảo tên hình ảnh phù hợp với ID
                price: parseInt(productPrice) // Chuyển đổi giá thành số nguyên
            };

            // Thêm sản phẩm mới vào mảng sản phẩm
            products.push(newProduct);

            // Cập nhật dữ liệu trong tệp JSON
            const updatedData = {
                catalories: data.catalories,
                product: products
            };

            // Gửi yêu cầu POST để cập nhật dữ liệu trong tệp JSON
            fetch('db.json', {
                method: 'POST',
                body: JSON.stringify(updatedData),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(() => {
                alert('Sản phẩm đã được thêm thành công!');
                window.location.href = 'admin-product.html'; // Chuyển hướng đến trang quản lý sản phẩm
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Đã có lỗi xảy ra khi thêm sản phẩm!');
            });
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Đã có lỗi xảy ra khi lấy dữ liệu từ tệp JSON!');
        });
    } else {
        alert('Vui lòng điền đầy đủ thông tin sản phẩm!');
    }
}



























// function addProduct(event) {
//     event.preventDefault(); // Ngăn chặn hành vi mặc định của sự kiện

//     // Lấy thông tin từ biểu mẫu
//     const productName = document.querySelector('input[name="prd_name"]').value;
//     const productPrice = parseFloat(document.querySelector('input[name="prd_price"]').value);
//     const productImage = document.querySelector('input[name="prd_image"]').files[0];

//     // Kiểm tra xem có thông tin cần thiết không
//     if (!productName || !productPrice || !productImage) {
//         alert("Vui lòng điền đầy đủ thông tin sản phẩm!");
//         return;
//     }

//     // Tạo đối tượng sản phẩm mới
//     const newProduct = {
//         name: productName,
//         price: productPrice,
//         image: productImage.name // chỉ lưu tên ảnh, không lưu ảnh trực tiếp
//     };

//     // Lấy dữ liệu hiện tại từ tệp JSON
//     fetch('db.json')
//     .then(response => response.json())
//     .then(data => {
//         // Thêm sản phẩm mới vào mảng sản phẩm hiện có
//         data.product.push(newProduct);

//         // Cập nhật tệp JSON trên máy chủ
//         return fetch('your_server_endpoint', {
//             method: 'PUT',
//             headers: {
//                 'Content-Type': 'application/json'
//             },
//             body: JSON.stringify(data)
//         });
//     })
//     .then(response => {
//         if (response.ok) {
//             console.log("Sản phẩm đã được thêm thành công!");
//             // Sau khi thêm sản phẩm thành công, có thể làm một số hành động khác tại đây
//             // Ví dụ: làm mới trang, cập nhật giao diện, vv.
//         } else {
//             console.error("Lỗi khi cập nhật tệp JSON trên máy chủ.");
//         }
//     })
//     .catch(error => {
//         console.error("Lỗi khi thêm sản phẩm:", error);
//     });
// }
