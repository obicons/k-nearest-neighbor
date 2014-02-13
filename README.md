# JARVIS
*JARVIS: Just A Rather Very Intelligent System*

Hopefully Marvel won't come after me for playfully using Iron Man's AI butler as the name of this system. 

## What is JARVIS?

I started playing around with Machine Learning a few months ago, and I've always been an Iron Man fan. I decided to write a (fun) little program in Common Lisp that demonstrates the nearest-neighbor algorithm. I used Common Lisp because:

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

## What needs done?

I still need to read input from a file and do a few more things to make JARVIS actually usable. A lot of the hardwork is done, though.

## TODO
   * Make installer
   * Make nicer to work with.

## Example usage
~~~~
# JARVIS
*JARVIS: Just A Rather Very Intelligent System*

Hopefully Marvel won't come after me for playfully using Iron Man's AI butler as the name of this system. 

## What is JARVIS?

I started playing around with Machine Learning a few months ago, and I've always been an Iron Man fan. I decided to write a (fun) little program in Common Lisp that demonstrates the nearest-neighbor algorithm. I used Common Lisp because:

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

## What needs done?

I still need to read input from a file and do a few more things to make JARVIS actually usable. A lot of the hardwork is done, though.

## TODO
   * Implement file reader so we can work with user's data.
   * Take user's data, normalize it, and graph it.
   * Find the points closest to our unknown.

## Example Usage 
~~~~
clisp main.lsp test-config \(100\ 2\)
~~~~
