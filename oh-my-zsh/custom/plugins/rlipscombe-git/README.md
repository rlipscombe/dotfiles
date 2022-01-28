My existing bash prompt shows the git status as follows:

- An opening square bracket, in white.
- The branch name. The colour is as follows:
  - Even with remote: blue
  - Ahead of remote: green (needs push)
  - Behind remote: red (needs pull)
  - Both: yellow (usually after a rebase; needs push -f)
- Staging area status, in green:
  - +1 ~2 -3 !4, for added, modified, deleted, unmerged
- Working copy status, in red:
  - ?1 ~2 -3 !4, for unknown, modified, deleted, unmerged
- A closing square bracket, in white.

## References

- <https://git-scm.com/docs/git-status#_output>
