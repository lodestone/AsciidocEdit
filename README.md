asciihelper
===========

Asciihelper is a MacOS application for helping to compose 
documents written in asciidoc (asciidoctor) markup.
It is written in Swift. Although it works at a very basic
level, it is in a very primitive state.  

See the screenshot im the images directory for this repo.

The app has two windows.  On the left, a basic text
editor which displys the source file, e.g `foo.ad`  
On the right is a window which displays the file
`foo.html` which `asciidoctor` produces from `foo.ad`.

At the moment the biggest issue is a "lag" in refreshing
the WebView (right-hand windowpane).  When you do cmd-S,
the text on the left is saved and `asciidoctor` is run 
on it.  However, for some reason you have to do cmd-S
**twice** to see the rendered output.  If someone
could help out on this, that would be great.

Installation
============

Installatin relies on the presence of `/usr/bin/asciidoctor`.

License
=======

MIT License
