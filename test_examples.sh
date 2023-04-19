#!/usr/bin/env bash

quarto render example.qmd &&
quarto render example_all.qmd &&
quarto render example_section_title.qmd &&
quarto render example_hide_header_text.qmd