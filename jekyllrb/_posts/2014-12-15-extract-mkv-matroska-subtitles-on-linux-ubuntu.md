---

layout: post

date:        "2014-12-15"
title:       "Extract MKV (Matroska) subtitles on Linux Ubuntu"
description: "Use MKVToolNix (a cross-platform set of tools to create, alter and inspect Matroska files) to find and extract the subtitles (and fonts)."

categories: [linux]
tags:       [ubuntu, mkv, matroska, subtitles]

---


Install [MKVToolNix] (cross-platform set of tools to create, alter and inspect Matroska files):

```
sudo apt-get install mkvtoolnix
```

Find the subtitle track number and the attachment IDs of the fonts using the [mkvinfo] tool (print information about elements in Matroska files):

```
mkvinfo movie.mkv
```

or using the GUI version:

```
mkvinfo -g
```

Assuming the subtitles are track 3, extract them using the [mkvextract] tool (extract tracks from Matroska files into other files):

```
mkvextract tracks movie.mkv 3:movie.***
```

Optionally extract also the font (by not specifying a file name for the font, the filename of the attached font will be used.
This needs to be done for each font that is attached):

```
mkvextract attachments movie.mkv FontID:
```

Install the fonts and regenerate the font cache so that the subtitles will be rendered properly:

```
cp *.ttf ~/.fonts
sudo fc-cache -v ~/.fonts
```

Make sure that the file is in MSDOS (CR-LF) format by using [flip] command:

```
sudo apt-get install flip
flip -m movie.srt
```


[MKVToolNix]: http://www.bunkus.org/videotools/mkvtoolnix/
[mkvinfo]:    http://www.bunkus.org/videotools/mkvtoolnix/doc/mkvinfo.html
[mkvextract]: http://www.bunkus.org/videotools/mkvtoolnix/doc/mkvextract.html
[flip]:       http://manpages.debian.org/cgi-bin/man.cgi?query=flip