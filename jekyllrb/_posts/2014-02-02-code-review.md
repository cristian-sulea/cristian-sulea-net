---

layout: post

title:       "Code Review"
description: "Code review is a phase in the software development process to catch bugs and design errors before the code becomes part of the product."

categories: [software development]
tags:       [code review]

resources:
  - "[Effective Code Review](http://alexgaynor.net/2013/sep/26/effective-code-review/)"
  - "[Effective Code Reviews Without the Pain](http://www.developer.com/tech/article.php/3579756/Effective-Code-Reviews-Without-the-Pain.htm)"
  - "[Code reviews in the 21st Century](http://www.javacodegeeks.com/2012/02/code-reviews-in-21st-century.html)"
  - "[Google (code+review)](http://www.google.com/search?q=code+review)"

---


Code review is a phase in the software development process in which other developers get together to review pieces of source code, with the intention of catching bugs and design errors before the code becomes part of the product.

Code reviews in most organizations are a painful experience for everyone involved. The developer often feels like it's a bashing session designed to beat out their will and the reviewers are often confused as to what is important to point out and what isn't.


## The Purpose

Code reviews often start off on the wrong foot because they are perceived as an unnecessary step that has been forced upon the developers or, in some cases, evidence that management doesn't trust the developers. Neither of these perspectives is accurate. Code reviews are a proven, effective way to minimize defects. Whatever additional motivations the organization has for performing code reviews, they are, at their core, an industry best practice.


## Catching bugs

The first purpose is to make sure that the code that is being produced has sufficient quality to be released. In other words, it's the acid test for whether the code should be promoted to the next step in the process.


## Raising the bus factor

Knowledge is spread across your team. There are no longer large blocks of code that only one person knows about.

The <a href="http://en.wikipedia.org/wiki/Bus_factor">bus factor</a> is the total number of key developers who would need to be incapacitated to send the project into such disarray that it would not be able to proceed.


## Ensuring readability

By getting someone else to provide feedback based on reading, rather than writing, the code you verify that the code is readable, and give an opportunity for someone with fresh eyes to suggest improvements. Also the code becomes more maintainable.


{% include resources.html %}
