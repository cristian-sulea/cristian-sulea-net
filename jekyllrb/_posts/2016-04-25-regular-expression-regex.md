---

layout: post

title:       "Regular Expressions (regex)"
description: "A regular expression (regex) is a sequence of characters that define a search pattern, mainly for use in pattern matching with strings, or string matching."

categories: [software development]
tags:       [regex]

resources:
  - "[Wikipedia - Regular expression](https://en.wikipedia.org/wiki/Regular_expression)"
  - "[RegExr](http://regexr.com)"
  - "[Stack Overflow](http://stackoverflow.com/questions/1762150/replace-the-line-containing-the-regex)"

---


A regular expression (regex) (sometimes called a rational expression) is a sequence of characters that define a search pattern, mainly for use in pattern matching with strings, or string matching.


## Cheat sheet


### Character classes

- `.` - any character except newline
- `\w` `\d` `\s` - word, digit, whitespace
- `\W` `\D` `\S` - not word, digit, whitespace
- `[abc]` - any of a, b, or c
- `[^abc]` - not a, b, or c
- `[a-g]` - character between a &amp; g


### Anchors

- `^abc$` - start / end of the string
- `\b` - word boundary


### Escaped characters

- `\t``\n``\r` - escaped special characters
- `\.` `\*` `\\` - tab, linefeed, carriage return
- `\u00A9` - unicode escaped &copy;


### Groups &amp; Lookaround

- `(abc)` - capture group
- `\1` - backreference to group #1
- `(?:abc)` - non-capturing group
- `(?=abc)` - positive lookahead
- `(?!abc)` - negative lookahead


### Quantifiers &amp; Alternation

- `a*` `a+` `a?` - 0 or more, 1 or more, 0 or 1
- `a{5}` `a{2,}` - exactly five, two or more
- `a{1,3}` - between one &amp; three
- `a+?` `a{2,}?` - match as few as possible
- `ab|cd` - match ab or cd


## Examples


### Single line comment

- `\/\/.*$` - will match all single line (`// ...`) comments


### Multiline momment

- `\/\*[\s\S]*?\*\/` - will match all multiline (`/* ... */`) comments


### Replace the line containing the Regex

- `^.*xyz.*$` - will match the lines containing the specified ("xyz" in this case) pattern
- `.*xyz.*` - in Java the regex does not default to DOTALL (single line mode) so we have to remove the `^` and `$`
- `.*@@.*(\r?\n|\r)?` - full regex that does not leave blank lines


### Email

`^([A-Z|a-z|0-9](\.|_){0,1})+[A-Z|a-z|0-9]\@([A-Z|a-z|0-9])+((\.){0,1}[A-Z|a-z|0-9]){2}\.[a-z]{2,3}$`

Acceptable

- abc1.1@domain.com
- abc.abc@domain.com
- abc_41.15768@domain.com
- 12345@domain.com
- 12.12.23@domain.com
- ABC.ABC.ABC.ABC0046@domain.com
- abc_123_4595@domain.com
- abc@asdas.co.in
- abc@insta123.com
- abc@inta.co.in

Non-Acceptable

- abc@@insta.com.com.com
- abc@insta..com
- abc@insta%.com
- abc@insta/.com
- abc@insta\.com
- abc..abc@domain.com
- abc__abc@domain.com
- abc.@insta.com
- abc..de@insta.com
- abc-@insta.com
- abc-def@insta.com
- abc+@insta.com
- abc123..45@insta.com
- abc%@insta.com
- abc\@insta.com
- abc/@insta.com
- abc@insta-.com
- ABC.ABC.ABC.ABC0046@domain.com.com.com
