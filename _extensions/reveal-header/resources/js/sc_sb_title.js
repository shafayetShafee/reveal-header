/**
 * reveal-header
 * A filter that adds header text and logo.
 * 
 * MIT License
 * Copyright (c) 2023-2024 Shafayet Khan Shafee.
 */
 
 function add_sc_sb_title() {
   
   function get_title() {
    var h1_arr = [];
    var h2_arr = [];
  
    Reveal.getSlides().forEach(el => {
      if (!el.matches('#title-slide')) {
       var h1 = el.querySelector('.title-slide h1')?.innerText;
       var h2 = el.querySelector('.title-slide h2')?.innerText;
       h1_arr.push(h1);
       h2_arr.push(h2);
      };
    });
    
    return [h1_arr, h2_arr]
  };
    
  function fill_array(ar) {
    let last_val = ar[0] || " ";
    for (let i = 1; i < ar.length; i++) {
      if (typeof ar[i] === 'undefined') {
        ar[i] = last_val;
      } else {
        last_val = ar[i];
      }
    }
    return ar
  };
  
  
  if (Reveal.isReady()) {
  
    if (document.querySelector('div.reveal-header img').getAttribute('src').length == 0) {
      document.querySelector('div.reveal-header').classList.add('no-logo')
    }
  
    var [h1_array, h2_array] = get_title();
    var filled_h1_array = fill_array(h1_array);
    var filled_h2_array = fill_array(h2_array);
    
    Reveal.getSlides().forEach((el, idx) => {
      if (!el.matches('#title-slide')) {
        el.setAttribute('data-sc-title', filled_h1_array[(idx - 1)])
        el.setAttribute('data-sb-title', filled_h2_array[(idx - 1)])
      }
    });
  
    Reveal.on( 'slidechanged', event => {
      let sp = Reveal.getSlidesElement().querySelector('.stack.present');
      
      if (sp != null) {
        let header = document.querySelector("div.reveal-header");
        
        // handling h1 section title (`.sc-title`)
        var section_text = event.currentSlide.getAttribute('data-sc-title') || " ";
        if (event.currentSlide.matches('.title-slide.level1')) {
          header.querySelector('.sc-title p').innerText = ""; 
        } else if (event.currentSlide.matches('.title-slide.level2')) {
          header.querySelector('.sc-title p').innerText = section_text;  
        } else {
          header.querySelector('.sc-title p').innerText = section_text;
        };
        
        // handling h2 section title (`.sb-title`)
        var sbsection_text = event.currentSlide.getAttribute('data-sb-title') || " ";
        if (event.currentSlide.matches('.title-slide.level1')) {
          header.querySelector('.sb-title p').innerText = "";
        } else if (event.currentSlide.matches('.title-slide.level2')) {
          header.querySelector('.sb-title p').innerText = "";
        } else {
          header.querySelector('.sb-title p').innerText = sbsection_text;
        };
      };
    });
  };
};


window.addEventListener("load", (event) => {
  add_sc_sb_title();
});



