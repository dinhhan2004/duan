document.addEventListener("DOMContentLoaded", function() {
    const categoryList = document.getElementById('categoryList');

    // Lấy dữ liệu từ tệp JSON
    fetch('db.json')
        .then(response => response.json())
        .then(data => {
            const categories = data.categories;

            // Lặp qua mỗi danh mục và thêm vào danh sách
            categories.forEach(category => {
                const li = document.createElement('li');
                li.textContent = category.name;
                categoryList.appendChild(li);
            });
        })
        .catch(error => console.error('Error:', error));
});
