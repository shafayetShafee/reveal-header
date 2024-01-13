# Reveal-header Extension For Quarto

A very simple Quarto filter extension for [`revealjs`](https://quarto.org/docs/presentations/revealjs/) output format that provides

- Support for adding header text like [`footer`](https://quarto.org/docs/presentations/revealjs/#footer-logo) on slides, level1 (`h1`) and level2 (`h2`) slide titles on slide header,

- Another YAML option to add a logo on top-left side of each slides. So by using this filter, it is possible to use two logos for each slides (One by using the default [`logo`](https://quarto.org/docs/presentations/revealjs/#footer-logo) option which adds the logo on bottom-right corner and another one by using `header-logo` option provided by this filter.)

- Provides YAML option `header-logo-link` and `footer-logo-link` to hyperlink the header logo and footer logo respectively.

View the Demos of using this filter,

- [`live demo 01`](https://shafayetshafee.github.io/reveal-header/example.html) 
- [`live demo 02`](https://shafayetshafee.github.io/reveal-header/example_all.html) 

## Installing

:warning: **This extension requires Quarto version to be at least 1.2**

```bash
quarto add shafayetShafee/reveal-header
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Using

This filter provides the following options,

| Option | Description |
|---|---|
| `header` | A simple header text to appear in the top part of the each slide. `header` can be overridden by `title-as-header` or `subtitle-as-header` or slide specific header. |
| `header-logo` | A path for logo image which will appear on the top-left corner of each slide. |
| `header-logo-link` | A link in quotes for the header logo. |
| `footer-logo-link` | A link in quotes for the footer logo. |
| `sc-sb-title` | `true` or `false`. Specifies whether level1 (`h1`) and level2 (`h2`) slide titles should appear in the slide header automatically when `slide-level` is 2 or 3. |
| `title-as-header` | `true` or `false`. Specifies whether the Slide title should appear as the slide header automatically. Will override the `header` text. |
| `subtitle-as-header` | `true` or `false`. Specifies whether the Slide subtitle should appear in the slide header automatically. Will override the `title-as-header`. |
| `hide-from-titleSlide` | Use `"text"` to remove the header text from title Slide, `"logo"` to remove the logo from top-left corner of header on the title Slide, `"all"` to remove both text and logo from the header on title Slide. |

Therefore an example could be,

```
---
title: "Quarto Presentations"
format:
  revealjs:
    slide-number: true
    logo: images/quarto.png
    footer: <https://quarto.org>
    header: Quarto Presentations with beautiful slide decks made by RevealJs
    header-logo: images/reveal_logo.svg
filters:
  - reveal-header
---


## Slides

```

Then the text `Quarto Presentations with beautiful slide decks made by RevealJs` will appear on the top margin of each slides (unless you use slide specific custom header) and similarly, the added logo will appear on top-left corner of each slide.

So the Title slide for the above example looks like,

<hr>

![Title Slide](images/revealjs_minimal_example_ss.png)

You can also include a custom header per-slide by adding a `header` div at the bottom of the the slide, as following,

```
## Slide

::: header

Custom Header

:::

```


Another example that uses all of the options,

```
---
format: 
  revealjs:
    slide-number: true
    logo: images/quarto.png
    sc-sb-title: true
    header: Quarto Presentations with beautiful slide decks made by RevealJs
    header-logo: images/reveal_logo.svg
    subtitle-as-header: true
    footer: <https://quarto.org>
filters: 
  - reveal-header
slide-level: 3
number-sections: true
---
```

For a complete example with the live demo of the rendered output, see below.


## Styling

Now to change the style of header components (i.e. logo, section and subsection title, header text), you can use the following css selectors,

- `.reveal-header .header-logo`: to change css properties of header image.
- `.reveal-header .header-text`: to change the styles of header text.
- `.reveal-header .sc-title`: to change the styles of section title on left side.
- `.reveal-header .sb-title`: to change the styles of sub-section title on right side.

Also, to change the header text style for slides with simple [`background`](https://quarto.org/docs/presentations/revealjs/#slide-backgrounds) attributes, use the css selector`.reveal-header .inverse-header`.


## Example

- The source code for a minimal example: [example.qmd](example.qmd) and the live demo of the rendered revealjs slides, [`example.html`](https://shafayetshafee.github.io/reveal-header/example.html)

- The source code for another example that uses all the options: [example_all.qmd](example_all.qmd) and the live demo of the rendered revealjs slides, [`example_all.html`](https://shafayetshafee.github.io/reveal-header/example_all.html)

- The source code for another example that uses only `sc-sb-title`: [example_section-title.qmd](example_section-title.qmd) and the live demo of the rendered revealjs slides, [`example_section_title.html`](https://shafayetshafee.github.io/reveal-header/example_section_title.html)

- The source code for example where header text is hidden on the title slide: [example_hide_header_text.qmd](example_hide_header_text.qmd) and the [`rendered output`](https://shafayetshafee.github.io/reveal-header/example_hide_header_text.html)
