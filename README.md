# sb(ScriBt)
A framework for vi's configuring.

## install
```
$ make clean && make
# make install
```
## uninstall 
```
# make uninstall
```

## Description

I'm tired of playing with editor,
vim? emacs? vs code? whatever I use,
the basic things stay the same:
I want to edit something,
and to do something when I'm editing.
What I reflect to a pattern of text,
what I want to do to interact with enviroment,
are all the things ought to be decided by myself.
If this goal was achieved, 
I didn't have to wait for someone's support 
on specific type of text.
You might have experience of being in trouble with
filetype defined by yourself,
maybe a configuration just used once,
the editor can not help you deal with this file,
except providing basic functions to write a txt,
this project aims exactly at this problem.

Based on this concept,
I wrote a simple Bourne Shell script together with traditional vi
to implement my own editing, 
see my archived "sb-old" repository for more imformation,
this project is its successor.
With the experience 
got from the more general purpose shell/ex implementation,
I decide to cut off some flexibility
to gain a more effective framework,
in order to reduce pains of typing and maintaining.
The concept can be implemented in other editors, 
even easier.

### About traditional vi 

I have been working with vi for months.
At first, it seemed strangely inconvenient.
I had some experience in using vim before,
compared to vim, a "insert" is actually a insert,
you can't touch anything when you pressed a "i",
except what you have inputted,
means if you wanted to fix a word "woord"
when cursor placed at "r",
the way I'd been used to, 
baskspace with a preceding "i",
was just banned.
Although it's a bad practice should be avoid,
being able to do that seems better than not after all.
There are a lot besides this,
one level undo, no syntax highlighting,
no auto-completion, etc...

But after the months of using,
I benifitted from all these shortcoming in fact.
For example, 
the lack of syntax highlighting and auto-completion forced
better organization of text and naming of new words.
The reason I chose vi as the implementation of my own editing
at the beginning is merely its simplicity and extensibility,
but it seems like a good choice now.

