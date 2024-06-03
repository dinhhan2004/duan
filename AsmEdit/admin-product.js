document.addEventListener("DOMContentLoaded", function () {
    // Lấy dữ liệu từ product.json
    fetch("db.json")
        .then(response => response.json())
        .then(data => {
            // Lấy danh sách sản phẩm từ JSON
            const productList = document.getElementById("productTable").getElementsByTagName('tbody')[0];

            data.product.forEach(product => {
                // Tạo phần tử HTML cho mỗi sản phẩm
                const productElement = document.createElement("tr");

                const idElement = document.createElement("td");
                idElement.textContent = product.id;

                const nameElement = document.createElement("td");
                nameElement.textContent = product.name;

                const priceElement = document.createElement("td");
                priceElement.textContent = product.price + ".000 VND";

                const imageElement = document.createElement("td");
                const image = document.createElement("img");
                image.src = product.image;
                image.alt = product.name;
                image.width = 50;
                image.height = 50;
                imageElement.appendChild(image);

                const soldElement = document.createElement("td");
                soldElement.textContent = product.sold;

                const categoryElement = document.createElement("td");
                categoryElement.textContent = product.category;

                const actionElement = document.createElement("td");
                const editButton = document.createElement("button");
                editButton.className = "btn btn-success";
                editButton.textContent = "Sửa";
                editButton.onclick = function () {
                    // Thực hiện hành động khi nhấn nút Sửa
                    location.href = 'edit_product.html?id=' + product.id;
                };

                const deleteButton = document.createElement("button");
                deleteButton.className = "btn btn-danger";
                deleteButton.textContent = "Xóa";
                // Thêm hành động khi nhấn nút Xóa

                actionElement.appendChild(editButton);
                actionElement.appendChild(deleteButton);

                // Thêm các phần tử vào sản phẩm
                productElement.appendChild(idElement);
                productElement.appendChild(nameElement);
                productElement.appendChild(priceElement);
                productElement.appendChild(imageElement);
                productElement.appendChild(soldElement);
                productElement.appendChild(categoryElement);
                productElement.appendChild(actionElement);

                // Thêm sản phẩm vào danh sách
                productList.appendChild(productElement);
            });
        })
        .catch(error => console.error("Error fetching data:", error));
});