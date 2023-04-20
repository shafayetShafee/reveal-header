#!/usr/bin/env bash

show_help() {
  echo "Usage: ./testing.sh <clean|render|move|open|help>"
  echo "  clean: Delete HTML files from the docs folder"
  echo "  render: Render example qmd files to HTML using quarto"
  echo "  move: Move HTML files to docs folder"
  echo "  open: Open HTML files from docs folder"
  echo "  help: Show this help message"
}

if [ $# -eq 0 ]; then
  echo "Error: No argument provided."
  show_help
  exit 1
fi

argument="$1"

case "$argument" in
  "clean")
    echo "Deleting HTML files from docs folder"
    rm -rf docs/*
    ;;
  "render")
    echo "Rendering qmd files using quarto"
    quarto render example.qmd &&
    quarto render example_all.qmd &&
    quarto render example_section_title.qmd &&
    quarto render example_hide_header_text.qmd
    ;;
  "move")
    echo "Moving HTML files to docs folder"
    mv *.html docs/
    ;;
  "open")
    echo "Opening HTML files from docs folder"
    for html_file in docs/*.html; do
      start "$html_file"
    done
    ;;
  "check_all")
    echo "Deleting HTML files from docs folder"
    rm -rf docs/*
    echo "Rendering qmd files using quarto"
    quarto render example.qmd &&
    quarto render example_all.qmd &&
    quarto render example_section_title.qmd &&
    quarto render example_hide_header_text.qmd
    echo "Moving HTML files to docs folder"
    mv *.html docs/
    echo "Opening HTML files from docs folder"
    for html_file in docs/*.html; do
      start "$html_file"
    done
    ;;
  "help")
    show_help
    ;;
  *)
    echo "Invalid argument: $argument"
    show_help
    exit 1
    ;;
esac

# Exit with success status
exit 0