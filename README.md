These files make up my bash profile. There's a `.bashrc`, a `.bash_profile` and a bunch of helpers.

Features:
 - color prompt.
 - terminal title bar follows prompt.
 - git status.

## Git Prompt

It works by running `git -c color.status=off status --short --branch` which outputs more-easily machine-readable output, such as:

### No repository.

    fatal: Not a git repository (or any of the parent directories): .git

### Branch header

The first line of the output is the branch details, prefixed by two '#' characters:

`git init`: If you've only just initialised a repository, you get:

    ## Initial commit on master

Once you've committed something, it changes to:

    ## master

TODO: branch.
TODO: ahead.
TODO: behind.
TODO: ahead and behind.

### File status

After the branch header, the output is one line per file, showing each file with a two character prefix, as `XY filename`, where 'X' refers to the index status, and 'Y' refers to the working status. Renames/moves are shown as 'XY bar -> baz'.

In the `tests` folder, there's a script which creates a new git repo and working directory, and populates it with all of the states that I could think of. When run, the output looks like this:

    ## master
    D  deleted
     D missing
     M modified
    M  modified_added
    R  old -> new
    A  new_added
    ?? untracked

TODO: Of course, the real question here is: "What do I actually want to see in the prompt?"

