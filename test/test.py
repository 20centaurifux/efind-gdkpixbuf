"""
	project............: efind-gdkpixbuf
	description........: efind-gdkpixbuf test suite.
	copyright..........: Sebastian Fedrau

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License v3 as published by
	the Free Software Foundation.

	This program is distributed in the hope that it will be useful, but
	WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
	General Public License v3 for more details.
"""
import subprocess, os, random, string

def test_search(argv, expected, success=True):
	cmd = ["efind", "test-data"] + argv

	print("Running efind, argv=[%s]" % ", ".join(cmd[1:]))

	proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	result = filter(lambda l: l != "", str(proc.stdout.read()).split("\n"))
	proc.wait()

	if not expected is None:
		assert(set(result) == set(expected))

	assert((success and proc.returncode == 0) or (not success and proc.returncode != 0))

def random_string(length=32):
	return "".join(random.choice(string.ascii_uppercase + string.digits) for _ in range(length))

SEARCH_ARGS = [[['type=file and image_channels()=4'],["test-data/100x80.gif", "test-data/32x32.bmp"]],
               [['type=file and image_channels()=3 or image_has_alpha()'], ["test-data/320x240.png", "test-data/100x80.gif", "test-data/32x32.bmp"]],
               [['type=file and image_width()=320 and image_height()=240'], ["test-data/320x240.png"]]]

INVALID_SEARCH_ARGS = [['readable and image_width()="320"'],
                       ['image_width("%s")' % (random_string())],
                       ['writable or image_has_alpha()>"%s"' % (random_string(1024))]]

if __name__ == "__main__":
	for argv, expected in SEARCH_ARGS:
		test_search(argv, expected)

	for argv in INVALID_SEARCH_ARGS:
		test_search(argv, None, False)
