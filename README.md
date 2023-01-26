# Reveal-header Extension For Quarto

A very simple Quarto filter extension for [`revealjs`](https://quarto.org/docs/presentations/revealjs/) output format that provides support for adding header text like [`footer`](https://quarto.org/docs/presentations/revealjs/#footer-logo) on slides and also provides another YAML option to add a logo on top-left side of each slides. 

So by using this filter, it is possible to use two logos for each slides (One by using the default [`logo`](https://quarto.org/docs/presentations/revealjs/#footer-logo) option which adds the logo on bottom-right corner and another one by using `header-logo` option provided by this filter.)

View the [live demo](https://shafayetshafee.github.io/reveal-header/example.html) of using this filter.

**Note that, this extension requires Quarto version to be at least 1.2**

## Installing

```bash
quarto add shafayetShafe/reveal-header
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Using

This filter provides two options `header` and `header-logo` for specifying the header text and logo image path that you want to appear on the top-left corner, respectively. So a minimal example is as follows, 

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

For a complete example with the live demo of the rendered output, see below.


## Styling

Now to change the style of header text and header logo, you can use the following combination of css selectors,

- `.reveal .reveal-header p`, to change the styles of header text.
- `.reveal .header-logo`, to change css properties of header image.

Also, to change the header text style for slides with simple [`background`](https://quarto.org/docs/presentations/revealjs/#slide-backgrounds) attributes, use the class `inverse-header`.


## Example

Here is the source code for a minimal example: [example.qmd](example.qmd) and the live demo of the rendered revealjs slides, [example.html](https://shafayetshafee.github.io/reveal-header/example.html)

