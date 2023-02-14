function add_header() {
  let header = document.querySelector("div.reveal-header");
  let reveal = document.querySelector(".reveal");
  reveal.insertBefore(header, reveal.firstChild);
  
  logo_img = document.querySelector('.header-logo img');
  if (logo_img.getAttribute('src') == null) {
    if (logo_img?.getAttribute('data-src') != null) {
      logo_img.src = logo_img?.getAttribute('data-src') || "";
      logo_img.removeAttribute('data-src'); 
    }
  }
}

window.onload = add_header();

// Reveal API

// Get the default header text element and innner HTML (i.e. literal text)
let header_text = document.querySelector("div.header-text p");
const header_inner_html = header_text.innerHTML;

// add the class inverse-header for slide with has-dark-background class
// otherwise remove it.
function add_class(has_dark, header_paras) {
  header_paras.forEach(el => {
    el.classList.remove('inverse-header');
    if(has_dark) {
      el.classList.add('inverse-header');
    };
  });
};

var header_paras = document.querySelectorAll("div.reveal-header p");

if (Reveal.isReady()) {
  let dark = Reveal.getCurrentSlide().classList.contains('has-dark-background');
  add_class(dark, header_paras);
}

Reveal.on( 'slidechanged', event => {
  let has_dark = event.currentSlide.classList.contains('has-dark-background');
  add_class(has_dark, header_paras);
});

// make the visibility of header text defined in slide body none
document.querySelectorAll('div.header').forEach(el => {
  el.style.display = 'none';
});

// dynamically changing the header
function change_header(dheader, cheader, ctext) {
  // dhead => dynamic header
  // chead => constant header
  // ctext => contstant header_text inner html
  if (dheader !== null) {
    cheader.innerHTML = dheader.innerHTML;  
  } else {
    cheader.innerHTML = ctext;
  }
}

// change the header if currently loaded slide has the header div defined
// which won't be captured by slidechanged event unless we change slides.
if (Reveal.isReady()) {
  let dynamic_header = Reveal.getCurrentSlide().querySelector('div.header p');
  change_header(dynamic_header, header_text, header_inner_html)
}

Reveal.on( 'slidechanged', event => {
  let dyn_header = event.currentSlide.querySelector('div.header p');
  change_header(dyn_header, header_text, header_inner_html);
});