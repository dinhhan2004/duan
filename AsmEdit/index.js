function them(button) {
  // Lấy thông tin về sản phẩm từ nút được nhấn
  const product = button.parentNode.parentNode;
  const name = product.querySelector('h3').textContent;
  const price = product.querySelector('p').textContent;
  const quantity = 1;

  // Thêm sản phẩm vào giỏ hàng
  const cart = JSON.parse(localStorage.getItem('cart')) || [];
  const item = cart.find(item => item.name === name);
  if (item) {
    item.quantity += quantity;
  } else {
    cart.push({ name, price, quantity });
  }
  localStorage.setItem('cart', JSON.stringify(cart));

 
 
}
function displayCart() {
  const cart = JSON.parse(localStorage.getItem('cart')) || [];
  const cartItemsElement = document.getElementById('cart-items');
  let total = 0;

   //Xóa tất cả các phần tử trong bảng
  while (cartItemsElement.firstChild) {
    cartItemsElement.removeChild(cartItemsElement.firstChild);
  }

  // Tạo các phần tử HTML tương ứng với các mặt hàng trong giỏ hàng
  cart.forEach(item => {
    const row = document.createElement('tr');

      // tên sp 
    const nameCell = document.createElement('td');
    nameCell.textContent = item.name;
    row.appendChild(nameCell);

      // giá sp
    const priceCell = document.createElement('td');
    priceCell.textContent = item.price;
    row.appendChild(priceCell);

    


      // số lượng
    const quantityInputCell = document.createElement('td');
const quantityInput = document.createElement('input');
quantityInput.type = 'number';
quantityInput.min = '1';
quantityInput.value = item.quantity;
quantityInput.addEventListener('change', () => {
const newQuantity = parseInt(quantityInput.value);
if (newQuantity <= 0) {
  // Nếu số lượng mới <= 0 thì xóa sản phẩm khỏi giỏ hàng
  const index = cart.findIndex(i => i.name === item.name);
  if (index >= 0) {
    cart.splice(index, 1);
    localStorage.setItem('cart', JSON.stringify(cart));
    displayCart();
  }
} else {
  // Cập nhật số lượng sản phẩm trong giỏ hàng
  item.quantity = newQuantity;
  localStorage.setItem('cart', JSON.stringify(cart));
  displayCart();
}
});
quantityInputCell.appendChild(quantityInput);
row.appendChild(quantityInputCell);


  // nút tăng số lượng
const increaseQuantityButtonCell = document.createElement('td');
const increaseQuantityButton = document.createElement('button');
increaseQuantityButton.textContent = '+';
increaseQuantityButton.addEventListener('click', () => {
item.quantity++;
localStorage.setItem('cart', JSON.stringify(cart));
displayCart();
});
increaseQuantityButtonCell.appendChild(increaseQuantityButton);
row.appendChild(increaseQuantityButtonCell);

// nút giảm số lượng
const decreaseQuantityButtonCell = document.createElement('td');
const decreaseQuantityButton = document.createElement('button');
decreaseQuantityButton.textContent = '-';
decreaseQuantityButton.addEventListener('click', () => {
if (item.quantity > 1) {
  item.quantity--;
  localStorage.setItem('cart', JSON.stringify(cart));
  displayCart();
}
});
decreaseQuantityButtonCell.appendChild(decreaseQuantityButton);
row.appendChild(decreaseQuantityButtonCell);

   
    // hình ảnh sản phẩm 
    const imageCell = document.createElement('td');
    const image = document.createElement('image');
    image.src = '/img/' + item.name.toLowerCase().replace(/ /g, '-') + '.jpg';
    image.alt = item.name;
    imageCell.appendChild(image);
    row.appendChild(imageCell);

      // nút xóa 
    const removeButtonCell = document.createElement('td');
    const removeButton = document.createElement('button');
    removeButton.textContent = 'Xóa';
    removeButton.addEventListener('click', () => {
      const index = cart.findIndex(i => i.name === item.name);
      if (index >= 0) {
        cart.splice(index, 1);
        localStorage.setItem('cart', JSON.stringify(cart));
        displayCart();
        
      }
    });
    removeButtonCell.appendChild(removeButton);
    row.appendChild(removeButtonCell);

        // thêm vào giỏ hàng
    cartItemsElement.appendChild(row);

    // Tính tổng thành tiền
    total += parseFloat(item.price.replace(/\D/g, '')) * item.quantity;
  });
 
  // Hiển thị tổng thành tiền
  const totalElement = document.getElementById('tong');
  totalElement.textContent = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(total);
  // reload web
  window.addEventListener('storage', () => {
location.reload();
});
}
displayCart();


















