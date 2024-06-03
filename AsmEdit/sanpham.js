
  function them(button) {
    // Lấy thông tin sản phẩm
    var name = document.querySelector('.product-info table tr:nth-child(1) td:nth-child(2)').textContent.trim();
    var price = document.querySelector('.product-info table tr:nth-child(2) td:nth-child(2)').textContent.trim().replace(/\D/g, '');
    var image = document.querySelector('.product-info .star').previousElementSibling.src;
    var quantity = 1;
  
    // Kiểm tra sản phẩm đã tồn tại trong giỏ hàng chưa
    var cart = JSON.parse(localStorage.getItem('cart')) || [];
    var existingItemIndex = cart.findIndex(item => item.name === name);
    if (existingItemIndex > -1) {
      // Nếu sản phẩm đã tồn tại trong giỏ hàng, tăng số lượng sản phẩm lên 1
      cart[existingItemIndex].quantity++;
    } else {
      // Nếu sản phẩm chưa tồn tại trong giỏ hàng, thêm mới sản phẩm vào giỏ hàng
      cart.push({name, price, image, quantity});
    }
  
    // Lưu thông tin giỏ hàng vào localStorage
    localStorage.setItem('cart', JSON.stringify(cart));
  
    // Thông báo thêm sản phẩm thành công
    alert('Thêm sản phẩm vào giỏ hàng thành công!');
  }
  
  
  