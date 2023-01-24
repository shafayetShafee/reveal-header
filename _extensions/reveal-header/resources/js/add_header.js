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

// Reveal API
Reveal.on( 'slidechanged', event => {
  let has_dark = event.currentSlide.classList.contains('has-dark-background');
  let header_text = document.querySelector("div.header-text p");;
  header_text.classList.remove('inverse-header');
  if(has_dark) {
    header_text.classList.add('inverse-header');
  }
  
});
  