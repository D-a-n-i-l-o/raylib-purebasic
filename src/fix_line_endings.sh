#!/bin/sh

#************************************************************************************
#
# MSVC++ compiler didn't like macOS line endings in the .c files, so we convert
# all line endings to line feed (lf) to work with all compilers across all platforms.
#
#************************************************************************************
#
# We use a small nodejs tool for the task:
#
# https://github.com/jurosh/nodejs-eol-converter-cli
#
# installation:  npm i -g eol-converter-cli
# usage example: eolConverter crlf "**/*.{txt,js,java,etc}"
#
cd pbhelper
eolConverter lf "**/*.{c,h}"
cd ..
