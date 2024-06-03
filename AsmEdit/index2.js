
document.addEventListener("DOMContentLoaded", function () {
    fetch("db.json") // JSON file
        .then(response => response.json())
        .then(data => {
            const products = data.product;
            displayProducts(products, "product-container");
        });
  });
  
  function displayProducts(products, containerId) {
    const productContainer = document.getElementById(containerId);
  
    products.forEach(product => {
      const productDiv = document.createElement("div");
      productDiv.classList.add("product-item");
  
      productDiv.innerHTML = `
      <div class="product">
        <img src="${product.image}" alt="${product.name}" />
        <a href="sp${product.id}.html" class="detail-button">Xem chi tiết</a>
        <h3>${product.name}</h3>
        <p>Giá: ${product.price}.000 VND</p>
        <div class="buttons" style="border-radius: 5px;">
          <button>Mua ngay</button>
          <button class="add-to-cart-button" onclick="them(this)">Thêm vào giỏ hàng</button>
        </div>
        </div>
      `;
  
      productContainer.appendChild(productDiv);
    });
  }
  
  
  