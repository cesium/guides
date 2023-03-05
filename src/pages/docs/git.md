---
title: Git / GitHub Workflow for CAOS
description: A tutorial on how to use Git and GitHub to contribute to CAOS
---

A tutorial on how to use Git and GitHub to contribute to CAOS

---
# Git / GitHub Workflow for CAOS

Git is a source version control system created by Linus Torvalds in 2005. This guide will walk you through configuring it so that you can start contributing to CAOS. Git is a system that works on repositories: a git repository contains all the source code of your application, as well as its history, i.e., all previous versions of it. These repositories need to be hosted somewhere, in order to be accessible by everyone. CeSIUM chose [GitHub](https://github.com/cesium) as its host, however, different hosts exist.


## Configuring your GitHub Account

The first step is to create a GitHub account. Go to [GitHub](https://github.com) and create your account.

### SSH Key

After your account is created, you need to configure your SSH keys in order to be able to authenticate whenever you upload your code. An [SSH key](https://www.ssh.com/academy/ssh-keys) is an access credential that will allow git to login in GitHub without you having to input your email and password - which, as an authentication method, has been removed by GitHub altogether. To generate an SSH key, go to your terminal and type

```
ssh-keygen
```

Hit Enter once (you don't need to change the default file to save the key), and enter a passphrase for extra security. Don't forget it, as you will be prompted to enter it anytime you need to authenticate.

To verify the keys have been generated correctly, check if the files `id_rsa` and `id_rsa.pub` have been created in the `.ssh` directory. You can do that with the command

```
ls -a ~/.ssh
```

Now you have to upload the key to GitHub. To do that, go to `Settings > SSH and GPG keys > New SSH key`. Give it a title, keep the key type as `Authentication Key`, and copy the contents of the `id_rsa.pub` file to the `key` field. You can get its contents by running the command

```
cat ~/.ssh/id_rsa.pub
```

**DO NOT UPLOAD OR SHARE YOUR `id_rsa` FILE WITH ANYONE. KEEP IT SAFE.** That is your private key and is, as the name suggests, a secret. If someone gets hold of your private key, **they can authenticate as yourself**.

Hit `Add SSH key` and you should be good to go as far as SSH is concerned.


### CeSIUM Organization

This is not needed. If you are not a member of our organization, you can still contribute as an outsider by forking the project. Details on how to do it will be explained later. If you do want to be a part of our organization, please reach out to us via our socials or via [email](mailto:caos@cesium.di.uminho.pt).


## Configuring Git Locally

You are almost ready to start working. But first, you need to configure your local git installation to match your GitHub account details.

First install `git` if you haven't already by using the command

| OS | Command |
| - | - |
| Ubuntu / Debian | `sudo apt-get install git` |
| Arch / Manjaro | `sudo pacman -S git` |
| Fedora / Red Hat | `sudo dnf -y install git` |

Verify installation by running

```
git -v
```

Now you need to configure your name and your email address. To do so run the commands

```
git config --global user.email "YOUR EMAIL"
git config --global user.name "YOUR NAME"
```

Congratulations! You are now ready to clone a repository!

## Cloning a repository

### Not a Member of CeSIUM

If you are not a member of CeSIUM on GitHub, you will need to fork the repository. In order to go that, go to its GitHub page and click the fork button on the top right corner. You should create a repository with exactly the same name under your ownership. You can clone it by running

```
git clone git@github.com:<YOUR USERNAME>/<Project Name>.git
```

### A Member of CeSIUM
If you are a member of the organization, cloning is as simples as running

```
git clone git@github.com:cesium/<Project Name>.git
```


## Start contributing

You can now start contributing! Simply `cd` into the project directory (`cd <Project Name>`) and create your branch.

By default, `git` wil have you work with the `main` branch (older repositories might have this branch named `master` instead, but this name is falling into disuse due to connotations with slavery), which, in all our repositories, is locked, meaning you cannot push to it directly. We will cover how you can get your code into the `main` branch later (when you will open your first PR), but, for now, all you need to know is that you need to be working on your own branch.

To create your own branch, run the command

```
git switch -c <YOUR INITIALS>/<FEATURE>
```

Your initials correspond to the first letter of your first and last name respectively, in lowercase. So, for example, if my name is John Doe, that would be `jd`. The feature corresponds to what you are working with. This should be very short (a couple of words maximum) and descriptive. Words should be separated by a hyphen (`-`). For example, if John Doe was working on implementing a new team page, that could be `new-team-page`. Putting it all together, the command would be

```
git switch -c jd/new-team-page
```


With that done, open your favourite text editor. We recomend VS Code, but you can pick your own.

### I have finished my work, now what?

Now that you are done (for now), you need to commit your changes to the remote repository (on GitHub). First check which files you have changed by running

```
git status
```

Of these files, check which ones you want to commit and run

```
git add <files>
```

It should be noted you can add multiple files at once, including folders, patterns, .etc, like the following example

```
git add pages/ components/*.tsx package.json
```

You can check it was added successfully by rerunning `git status`. Now commit your changes by running

```
git commit -m "<YOUR COMMIT MESSAGE>"
```

The commit message should be short, concise and to the point. It should be written in the present tense (and not the past), and should describe what you did. For example, following the previous example

```
git commit -m "Add new team page"
```

Now it is time to push your changes. If it is the first time you push this branch, run the following command

```
git push --set-upstream origin <YOUR BRANCH NAME>
```

This will create your branch on the remote and push the changes to it. After that, if you want to push again you can run just a

```
git push
```

## Opening a Pull Request

Remember when we said you could not push to `main` directly and how we would explain how to get your code into `main` later? This is the section. When you finish your work, you should open a Pull Request (or PR, for short), indicating you want to have your code merged into the `main` branch. To do that, go to GitHub, click the Pull Requests tab, click New Pull Request. Now you have to make multiple choices:

- Base branch: `main`
- Compare: your branch

Click "Create New Pull Request". Now you must:

- Name your PR: pick a name (in the present tense) that is short and descriptive
- Pick some reviewers: try to pick people from the board on the current year, or people who have recently contributed to the same repository
- Assign: always assign **yourself** to your PRs

After you create the Pull Request, someone will review it. This can take up to 24h for important projects, and up to a week for everything not urgent.

The reviewer can either approve your PR, make comments or request changes. We try to review PRs in a constructive and educational manner, so don't be upset if it takes a few tries before it is approved. You learn the most by people commenting on your PR and suggesting new and better approaches to your problems, not by coding a solution.

## Checks: CI / CD

Once you open your PR, you may notice a few automatic checks happening, like the following image.

![CI checks in progress](/images/git/ci.png "CI checks in progress")

 These checks are part of what's called *Continuous Integration / Continuous Delivery*, or CI/CD, for short. In order for your PR to be merged, these checks must pass. Normally there are 2/3 checks performed:

- Code Quality: this checks if your code follows our style guidelines. If this task fails, you can fix it by running `npm run format` on Next.js projects and `mix format` on Elixir projects. `npm run lint` and `mix lint` might also be needed

- Build and Test: this only applies to backend projects, and it checks to make sure all the tests in the codebase run successfully (and that the project compiles, of course). You can simulate this task by running `mix test` on your local machine. If any tests fail, you will need to fix them before merging

- Deploy Previews: deploys your branch on a temporary URL for testing purposes. If all other tasks pass, this one should not be a problem and, if it is, it probably is something DevOps related, so contact the person in charge of that.


## Rebases, Merges and Conflicts

It may happen that, in the time you opened your PR and someone approved it, another PR was merged and it causes conflicts with your code. This would be indicated in GitHub like the following image.

![Merge conflicts](/images/git/conflicts.png "Merge Conflicts")

To fix this, you can do two things: rebase your branch so it is up to date with `main` - we recommend doing this 90% of the time - or merging your branch with `main` - which we only recommend if the rebase process would be very difficult.

### Rebase

To rebase your branch start by updating your `main` branch by running:

```
git switch main
git pull
```

Now switch back to your branch and start the rebase:

```
git switch <YOUR-BRANCH>
git rebase main
```

Now go to your favourite text editor, and fix the conflicts yourself. Once you are done, add all the files and continue with the rebase.

```
git add <FILES CHANGED>
git rebase --continue
```

You might have to repeat this a few times before the rebase succeeds. When it does, it is time to push your branch to the remote. However, a rebase is a rewriting of history, meaning you will have to force push by running

```
git push -f
```

### Merge

To merge your branch start by updating your `main` branch by running:

```
git switch main
git pull
```

Now switch back to your branch and start the merge:

```
git switch <YOUR-BRANCH>
git merge main
```

Now go to your favourite text editor, and fix the conflicts yourself. Once you are done, add all the files and continue with the merge.

```
git add <FILES CHANGED>
git merge --continue
```

Now it is time to push your branch to the remote.

```
git push
```

# Troubleshooting

## I have commits that shouldn't be on my branch and want to delete them. How? (Interactive rebases)

This can happen when you accidentally base your branch off of another branch other than `main`, or if you have an erroneous commit in the middle of your history you want to delete. To do that, you simply update `main` and do an interactive rebase:

```
git switch main
git pull
git switch <YOUR BRANCH>
git rebase -i main
```

If the last command fails, you may need to set a default text editor for `git`. You do that by running the command

```
git config --global core.editor "nano"
```

You can replace `nano` with any other editor, like `vim`, but `nano` is lightweight and easy to use.

Now you simply drop the commits you don't want and keep the ones you do, like the image.

![Interactive Rebase in progress](/images/git/rebase.png "Interactive Rebase")

Now save the file and exit the editor. The rebase should succeed. If there are any conflicts, solve them. Once you are done, push your changes:

```
git push -f
```