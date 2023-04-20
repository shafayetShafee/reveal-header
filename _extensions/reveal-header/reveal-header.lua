--[[
MIT License

Copyright (c) 2023 Shafayet Khan Shafee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]--


local function ensureHtmlDeps()
  quarto.doc.add_html_dependency({
    name = "reveal-header",
    version = "1.0.0",
    scripts = {
        { path = "resources/js/add_header.js", attribs = {defer = "true"}}
      },
    stylesheets = {"resources/css/add_header.css"}
  })
end

local function sc_sb_title()
  quarto.doc.add_html_dependency({
    name = "sc-sb-title",
    version = "1.0.0",
    scripts = {
        { path = "resources/js/sc_sb_title.js", attribs = {defer = "true"}}
      }
  })
end

local function grid_htext()
  quarto.doc.add_html_dependency({
  name = "grid-htext",
  version = "1.0.0",
  stylesheets = {"resources/css/grid_htext.css"}
})
end

local function grid_no_htext()
  quarto.doc.add_html_dependency({
  name = "grid-no-htext",
  version = "1.0.0",
  stylesheets = {"resources/css/grid_no_htext.css"}
})
end


if quarto.doc.is_format('revealjs') then
  -- Ensuring the dependencies got loaded before proceeding
  ensureHtmlDeps()
  function Pandoc(doc)
    local blocks = doc.blocks
    local str = pandoc.utils.stringify
    local meta = doc.meta
    if meta['sc-sb-title'] then
      sc_sb_title()
    end
    if meta['header'] then
      grid_htext()
    else
      grid_no_htext()
    end
    local header_text = meta['header'] and str(meta['header']) or " "
    local header_para_class = {class = "header-text"}
    if meta['title-as-header'] then
      header_text = meta['title']
      header_para_class = {class = "header-text title-text"}
    end
    if meta['subtitle-as-header'] then
      header_text = meta['subtitle']
      header_para_class = {class = "header-text title-text"}
    end
    -- make divs structure for holding text and logo.
    local header_logo = meta['header-logo'] and str(meta['header-logo']) or ""
    local header_img = pandoc.Div(pandoc.Image("", header_logo, ""), {class = "header-logo"})
    local header_section = pandoc.Div(pandoc.Para(" "), {class = "sc-title"})
    local header_sbsection = pandoc.Div(pandoc.Para(" "), {class = "sb-title"})
    local header_para = pandoc.Div(pandoc.Para(header_text), header_para_class)
    if meta['hide-from-titleSlide'] then
      local hide = str(meta['hide-from-titleSlide'])
      if hide == "text" then
        header_para.attributes['hide-from-titleslide'] = "true"
      elseif hide == "logo" then
        header_img.attributes['hide-from-titleslide'] = "true"
      elseif hide == "all" then
        header_para.attributes['hide-from-titleslide'] = "true"
        header_img.attributes['hide-from-titleslide'] = "true"
      end
    end
    local div = pandoc.Div(
      {
        header_img,
        header_section,
        header_para,
        header_sbsection
      }, 
      {class = 'reveal-header'})
    table.insert(blocks, div)
    return doc
  end
end