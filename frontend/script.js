fetch("http://localhost:5000/products")
  .then(res => res.json())
  .then(data => {
    let html = "";
    data.forEach(p => {
      html += `<p>${p.name} - $${p.price}</p>`;
    });
    document.getElementById("products").innerHTML = html;
  });
