---

layout: post

date:        "2016-02-03"
title:       "CSS Font Size (px vs. em vs. percent vs. pt)"
description: "The font-size property sets the size of the text. There are four different units for the font-size value: px, em, percent and pt."

categories: css font size

resources:
  - "[W3Schools - CSS Fonts](http://www.w3schools.com/css/css_font.asp)"
  - "[Kyle Schaeffer - CSS Font-Size](http://kyleschaeffer.com/development/css-font-size-em-vs-px-vs-pt-vs/)"
  - "[Font Size Conversion Chart](http://websemantics.co.uk/resources/font_size_conversion_chart/)"

---


The font-size property sets the size of the text. There are four different units for the font-size value: px, em, percent and pt.


## The Units


### Pixels (px)

Pixels are fixed-size units that are used in screen media (i.e. to be read on the computer screen).
Setting the text size with pixels gives you full control over the text size.
One problem with the pixel unit is that it does not scale upward for visually-impaired readers or downward to fit mobile devices.


### Ems (em)

1em is equal to the current font size. For instance, if the font-size of the document is 12pt, then 1em is equal to 12pt.
The em size unit is recommended by the W3C, due to scalability and their mobile-device-friendly nature.


### Percent (%)

The current font-size is equal to 100% (i.e. 12pt = 100%).
While using the percent unit, the text remains fully scalable for mobile devices and for accessibility.


### Points (pt)

Points are traditionally used in print media (anything that is to be printed on paper, etc.).
One point is equal to 1/72 of an inch. Points are much like pixels, in that they are fixed-size units and cannot scale in size.


## Font Size Conversion Chart

[![font size conversion chart]({{site.images}}{{page.url}}font-size-conversion-chart.png)]({{site.images}}{{page.url}}font-size-conversion-chart.png)


{% include resources.html %}
