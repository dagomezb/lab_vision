# Warmup Questions

1.  What is the clone url of this repository?
    >   https://github.com/dagomezb/lab_vision.git

2.  What is the output of the ``cal`` command?

        February 2015
        Su Mo Tu We Th Fr Sa
        1  2  3  4  5  6  7
        8  9 10 11 12 13 14
        15 16 17 18 19 20 21
        22 23 24 25 26 27 28

# Homework Questions

1.  What is the ``grep``command?
    >   The grep utility searches any given input files, selecting lines that match one or more patterns.

2.  What is a *makefile*?
    >   Makefiles are special format files that together with the make utility will help you to automagically build and manage your projects.


3.  What is *git*?
    >   Git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals.

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   The find utility recursively descends the directory tree for each path listed, evaluating an expression in terms of each file in the tree. 
-- prune This primary always evaluates to true.  It causes find to not descend into the current file.  Note, the --prune primary has no effect if the --d option was specified.


5.  Where is the file ``xxxxxx``
    >   find / -name "xxxxxx"

6.  How many files with ``gnu`` in its name are in ``dir``
    >   find /usr/src -name ``"*gnu*"`` | wc -l 

7.  How many files contain ``gpl`` inside in ``dir``
    >   find /usr/src/ -exec grep -l "gpl" {} \; | wc -l

8.  What does the ``cut`` command do?
    >   cut out selected portions of each line of a file

9.  What does the ``wget`` command do?
    >   GNU Wget is a free utility for non-interactive download of files from the Web. It supports HTTP,HTTPS, and FTP protocols, as well as retrieval through HTTP proxies.


10.  What does the ``diff`` command do?
    >   compare files line by line

11.  How many users exist in *Guitaca*?
    >   48

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   cat /etc/passwd | cut -d : -f1,7 | sort -t : -k 2

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   cat /etc/passwd | grep "/sbin/nologin" | wc -l

14.  What is the name of the linux distribution running on *Guitaca*?
    >   Fedora release 20 (Heisenbug)

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >   Is the shebang, and in this case is a call to shell Bash. Under Unix operating systems, when a script with a shebang is run as a program, the program loader parses the rest of the script's 	initial line as an interpreter directive; the specified interpreter program is run instead, passing to it as an argument the path that was initially used when attempting to run the script.

17. How many unique images are in the ``sipi_images`` folder?
    >   find sipi_images -type f -exec md5sum '{}' \+ | sort | uniq -u | wc -l
    
