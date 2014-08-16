AsciidocEdit
===========

AsciidocEdit is a MacOS application for helping to compose 
documents written in asciidoc markup.  Two panes are
shown side-by-side in the main window.  On the left
is the source file (asciidoc).  On the right is the
html rendered from it.  You will find the html file in
the same directory as the source file.   

Type cmd-S to save and render.
See the screenshots in the images directory for this repo.

AsciidocEdit is written in Swift.  It calls on 
[Asciidoctor](http://asciidoctor.org) (`/usr/bin/asciidoctor`) to process
the source file. 

This is version 0.1

Installation
============

Clone, then compile project with XCode, v6.0 beta 6 or later. You must have `asciidoctor` 
installed in `/usr/bin/asciidoctor` for `AsciidocEdit` to work.  See [Asciidoctor](http://asciidoctor.org)

- To use "Save As PDF", you must have `asciidoctor-pdf` installed in `/usr/bin/asciidoctor-pdf`.
I have not been able to test this feature: while I can install `asciidoctor-pdf` on my
machine, I have not been able to install it in `/usr/bin/asciidoctor-pdf`.
See [asciidoctor-pdf](https://github.com/asciidoctor/asciidoctor-pdf).

- To use "Compile EPUB3", you must have `asciidoctor-epub3` installed in `/usr/bin/asciidoctor-epub3`.
See [asciidoctor-epub3](https://github.com/asciidoctor/asciidoctor-epub3).  I have made 
a few (successful) tests of this feature. 

Options
=======

- Select "File>Use LaTeX Mode" if you wish to use conventional LaTeX syntax, e.g.,
`$a^2 + b^2 = c^2$` and `\[a^3 + b^3 = c^3\]`.  See the notes `tex/README` in this
repository for instructions on the installation needed to make this option work.
You still have to put the code `:stem: latexmath` in your source file to activate
math processing.

Issues
======

**Menu Items:**

- "Save as PDF" may not work because of `asciidoctor-pdf` installation
issues.  It MUST be installed as `/usr/bin/asciidoctor-pdf`

- "Install Asciidoctor" does not work and may never work becaue
of sandbox and permission issues.  If I can't solve this one,
I will eliminate this menu item.


Planned features
===============

- Multiple windows


I welcome suggestions

Notes
=====

- The file types you can open are `.ad`, `.adoc`, and `.asciidoc`


Distribution
============

This app will be distributed on the appstore
for free when it is suitable for "publication".  Up-to-date source
code will remain here and the app can always be compiled
from it.


License
=======

MIT License
