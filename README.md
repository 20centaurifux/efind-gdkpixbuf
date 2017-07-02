# efind-gdkpixbuf

## Introduction

**efind-gdkpixbuf** is an extension for [efind](https://github.com/20centaurifux/efind).
It makes it possible to filter find results by image properties.

You need [gdk-pixbuf2](https://developer.gnome.org/gdk-pixbuf/) to build this
extension.

## Available functions

### image\_width()

Returns image width.

	$ efind . 'image_width()>=800'

### image\_height()

Returns image height.

	$ efind . 'image_height()>=image_width()'

### image\_has\_alpha()

Checks if image has an alpha channel.

	$ efind . 'name="*.gif" and image_has_alpha()'

### image\_bits\_per\_sample()

Gets the number of channels.

	$ efind . 'image_bits_per_sample()>=2'
