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


if quarto.doc.is_format('revealjs') then
  -- Ensuring the dependencies got loaded before proceeding
  ensureHtmlDeps()
  
  -- make divs structure for holding text and logo.
  function Pandoc(doc)
    local blocks = doc.blocks
    local str = pandoc.utils.stringify
    local meta = doc.meta
    local header_text = meta['header'] and str(meta['header']) or " "
    local header_logo = meta['header-logo'] and str(meta['header-logo']) or ""
    local header_img = pandoc.Image("", header_logo, "", {class = "header-logo"})
    local header_para = pandoc.Div(pandoc.Para(header_text), {class = "header-text"})
    local div = pandoc.Div({header_img, header_para}, {class = 'reveal-header'})
    table.insert(blocks, div)
    return doc
  end
end