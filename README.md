# k-nearest-neighbor

## What is k-nearest-neighbor?

I started playing around with Machine Learning a few months ago. I decided to write a (fun) little program in Common Lisp that demonstrates the nearest-neighbor algorithm. I used Common Lisp because:

1. I know it.
2. It's easy to work with.

Essentially, you give JARVIS a file with data like this:
~~~~
(3 5 this-type)
(999 1009.2 that-type)
~~~~
And run the command:
> jarvis given this \<file-name\> what is (\<x y\>)

And it will try to answer your question.

## TODO
   * Make installer
   * Make nicer to work with.

## Example Usage
~~~~
clisp main.lsp given this \"test-config\" what is \'\(2\ 100\)
~~~~

## License 
Released under GPL v. 3+
