  function add_header() {
    let header = document.querySelector("div.reveal-header");
    let reveal = document.querySelector(".reveal");
    reveal.insertBefore(header, reveal.firstChild);
    
    logo_img = document.querySelector('img.header-logo');
    if (logo_img.getAttribute('src') === null) {
      logo_img.src = logo_img.getAttribute('data-src');
      logo_img.removeAttribute('data-src');
    }
  }
  
  window.onload = add_header();