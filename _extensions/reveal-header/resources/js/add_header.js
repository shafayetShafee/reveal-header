  function add_header() {
    let header = document.querySelector("div.reveal-header");
    let reveal = document.querySelector(".reveal");
    reveal.insertBefore(header, reveal.firstChild);
  }
  
  window.onload = add_header();