---

layout: post

title:       "PHP - List Files and Directories"
description: "The older way is scandir but DirectoryIterator is probably the best way. There's also readdir (to be used with opendir) and glob."

categories: [java]
tags:       [files]

resources:
  - "[PHP Manual](http://php.net/manual/en/index.php)"
  - "[Paolo Bergantino](http://stackoverflow.com/users/16417/paolo-bergantino) answered to a question posted on [Stack Overflow](http://stackoverflow.com/questions/1086105/get-the-files-inside-a-directory)"

---


The older way is [scandir](http://www.php.net/scandir) but [DirectoryIterator](http://www.php.net/manual/en/class.directoryiterator.php) is probably the best way.
There's also [readdir](http://www.php.net/readdir) (to be used with [opendir](http://www.php.net/manual/en/function.opendir.php)) and [glob](http://www.php.net/glob).


## The DirectoryIterator class

```php
foreach (new DirectoryIterator('.') as $file) {
    if ($file->isDot()) continue;
    print $file->getFilename() . '<br>';
}
```

- <http://php.net/manual/en/class.directoryiterator.php>


## scandir

```php
$files = scandir('.');
foreach($files as $file) {
    if ($file == '.' || $file == '..') continue;
    print $file . '<br>';
}
```

- <http://php.net/manual/en/function.scandir.php>


## opendir and readdir

```php
if ($handle = opendir('.')) {
    while (false !== ($file = readdir($handle))) {
        if($file == '.' || $file == '..') continue;
        print $file . '<br>';
    }
    closedir($handle);
}
```

- <http://php.net/manual/en/function.opendir.php>
- <http://php.net/manual/en/function.readdir.php>


## glob

```php
foreach (glob("*") as $file) {
    if ($file == '.' || $file == '..') continue;
    print $file . '<br>';
}
```

- <http://php.net/manual/en/function.glob.php>
