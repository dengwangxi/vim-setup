# vim-setup
My ~/.vimrc and ~/.vim/.ycm_extra_conf.py files

OS: Ubuntu 14.04

Vim is my IDE for C/C++, Go, and Python programming. For each language, I can easily

- look up library documentation
- autocomplete dynamically (i.e. while I am typing)
- create my own snippets
- configure syntax highlighting 

all while enjoying the Vim key bindings that make Vim a superb text editor. The files included are those that must be modified in order to obtain a unique coding experience in Vim.

Before anything, you have to ensure your locale is set to UTF-8 or everything will look off. In terminal,

    $ locale
    
Initially, my locale was set to POSIX. To set it to UTF-8, in my ~/.profile, I added the following.

    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
    export LANGUAGE=en_US.UTF-8
    
And I specified my UTF-8 encoding in my .vimrc

    set encoding=utf-8
    
I set up my Vim environment using the Plugin editor Vundle (https://github.com/VundleVim/Vundle.vim).
Plugins included are

1. Vim Airline (https://github.com/vim-airline/vim-airline)
2. Vim Airline Themes (https://github.com/vim-airline/vim-airline-themes)
3. YouCompleteMe with Clang Completer (https://github.com/Valloric/YouCompleteMe)
4. Ultisnips (https://github.com/SirVer/ultisnips)
5. Nerdtree (https://github.com/scrooloose/nerdtree)
6. ...and being a Gopher... Vim-go (https://github.com/fatih/vim-go) 

After installing each plugin, I created ~/.vim/.ycm_extra_conf.py

YouCompleteMe provides a default .ycm_extra_conf.py (https://github.com/Valloric/ycmd/blob/master/cpp/ycm/.ycm_extra_conf.py)
But what has to be configured in order to get C-family semantic completion for your system is the list of compilation flags.
This is where the paths to the C libraries must be specified.

Using GCC and Ubuntu 14.04, I did a build of a test.c with the -v flag.

    $ gcc -c -v test.c
    
The verbose output should render along the lines something like

    ...
    include <...> search starts here:
    /usr/lib/gcc/x86_64-linux-gnu/4.8/include
    /usr/local/include
    /usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed
    /usr/include/x86_64-linux-gnu
    /usr/include
    End of search list.
    ...
    
These are the paths to specify in .ycm_extra_conf.py
Therefore you will see in my .ycm_extra_conf.py

    '-std=c11',
    # ...and the same thing goes for the magic -x option which specifies the
    # language that the files to be compiled are written in. This is mostly
    # relevant for c++ headers.
    # For a C project, you would set this to 'c' instead of 'c++'.
    '-x', 'c',
    # This path will only work on OS X, but extra paths that don't exist are not
    # harmful
    '-isystem', '/usr/local/include',
    '-isystem', '/usr/include',
    '-isystem', '/usr/include/x86_64-linux-gnu',
    '-isystem', '/usr/lib/gcc/x86_64-linux-gnu/4.8/include',
    '-isystem', '/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed',
    '-I.',
    
'-I.' just means pass the current directory's path.
Finally, I just passed the path to the .ycm_extra_conf.py in my .vimrc

    let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
    
Now the last and most simple thing to do is configure Python autocompletion.
For that I just passed the path to my Python3 binary into a YCM variable in my .vimrc

    let g:ycm_python_binary_path = '/usr/bin/python3'
    
The rest of the work was just mapping keys and configuring some Plugin variables. I set *tab* to 
expand snippets, and *enter* to effectively fulfill the terminal tab completion function in YouCompleteMe.
My *leader* key is set to the space key. And *leader*gd is set to display documentation about whatever my 
cursor is on in the proper language.

I should also mention that in order to use vim-go for golang, it's necessary to include
$GOPATH/bin/ in your PATH variable so that the binaries can be accessed.
So in my .profile, I have the following lines of code for Go.

    export PATH=$PATH:/usr/local/go/bin
    export GOPATH=$HOME/go_programs
    export PATH=$PATH:$GOPATH/bin
    
Thanks for reading!
