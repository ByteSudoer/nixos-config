{ pkgs, ... }:
pkgs.writeShellScriptBin "pdf_merger" ''
  #!/usr/bin/env bash

  if [ "$#" -ne 4 ];then
    echo "Usage: $0 <main.pdf> <prepend.pdf> <append.pdf> <output.pdf>"
    exit 1
  fi

  # Assign arguments to variables
  MAIN_PDF="$1"
  PREPEND_PDF="$2"
  APPEND_PDF="$3"
  OUTPUT_PDF="$4"


  # Check if all input files exist
  if [[ ! -f "$MAIN_PDF" || ! -f "$PREPEND_PDF" || ! -f "$APPEND_PDF" ]]; then
      echo "Error: One or more input PDF files do not exist."
      exit 1
  fi

  ${pkgs.pdftk}/bin/pdftk "$PREPEND_PDF" "$MAIN_PDF" "$APPEND_PDF" cat output "$OUTPUT_PDF"

  # Check if the operation was successful
  if [ $? -eq 0 ]; then
      echo "Merged PDF created successfully: $OUTPUT_PDF"
  else
      echo "Error: Failed to merge PDFs."
      exit 1
  fi
''
