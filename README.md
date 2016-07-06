# Au Pair

## Installation

`gem install aupair`

## What's it?

A dumb little tool for quickly adding the github remotes for your pairs.

## How do I use it?

Instead of having to remember everyone's github usernames, just do this:

`aupair add kit`

and their github remote will be added for the current repo (assuming it has the name as the working directory)

`git remote -v`

`#=> kit  https://github.com/kitlangton/aupair.git (push)`

### But wait—

Yes! I know! **Don't Worry!** The first time you type `aupair add kit` and it doesn't yet know the person's username, it will prompt you:

`Hey, what's Kit's GitHub username?`

and then you will tell it and it know forever and ever (until you switch computers or delete the hidden YAML file in your home directory)

## Cool, I guess. Bye.
