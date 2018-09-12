---

layout: post

date:        "2014-03-05"
title:       "Install bash-completion package on Linux"
description: "The programmable completion feature in Bash permits typing a partial command, then pressing the [Tab] key to auto-complete the command sequence."

categories: [bash-completion, bash completion, bash, linux]

resources:
  - "[http://packages.debian.org/wheezy/bash-completion](http://packages.debian.org/wheezy/bash-completion)"

---


`bash-completion` extends bash's standard completion behavior to achieve complex command lines with just a few keystrokes.
This project was conceived to produce programmable completion routines for the most common Linux/UNIX commands, reducing the amount of typing sysadmins and programmers need to do on a daily basis.

> programmable completion (autocomplete) for the bash shell

The programmable completion feature in `bash` permits typing a partial command, then pressing the `[Tab]` key to auto-complete the command sequence.
If multiple completions are possible, then `[Tab]` lists them all.


## Ubuntu / Debian

{% highlight bash %}
apt-get install bash-completion
{% endhighlight %}


## Fedora

{% highlight bash %}
yum install bash-completion
{% endhighlight %}


{% include resources.html %}