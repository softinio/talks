---
author: Salar Rahmanian (www.softinio.com)
date: MMMM dd, YYYY
paging: (Elevating Python Development with Nix) %d / %d
---

# Show and Tell

1. Nix Shell
2. devenv
3. Nix Flakes
4. Flake Templates and Migrating an existing python project to Nix and Flakes

---

# Show and Tell

1. `Nix Shell`
2. devenv
3. Nix Flakes
4. Flake Templates and Migrating an existing python project to Nix and Flakes

## Nix Shell

I can't believe I don't have `python` or `wget` installed on my laptop ugh !

---

# Show and Tell

1. `Nix Shell`
2. devenv
3. Nix Flakes
4. Flake Templates and Migrating an existing python project to Nix and Flakes

## Nix Shell

What happened, I don't have `python` or `wget` installed on my laptop anymore !

---

# Show and Tell

1. `Nix Shell`
2. devenv
3. Nix Flakes
4. Flake Templates and Migrating an existing python project to Nix and Flakes

## Nix Shell

```
nix-shell -p <package you want>
```

or 

```
nix shell nixpkgs#<package you want>
```

---

# Show and Tell

1. `Nix Shell`
2. devenv
3. Nix Flakes
4. Flake Templates and Migrating an existing python project to Nix and Flakes

## Nix Shell

### Wouldn't it be nice if once you are in your project folder you have all your OS and python dependencies specific to your project installed and services setup?

### Kind of like pythons virtualenv but with your non-python dependencies installed and services setup for you.

---

# Show and Tell

1. `Nix Shell`
2. devenv
3. Nix Flakes
4. Flake Templates and Migrating an existing python project to Nix and Flakes

## Nix Shell

- How you define a shell?
- Purpose of `shell.nix` and `default.nix` & their Structure 
- Shell 1: We want some python dependencies
- Shell 2: We need postgresql for our development
- Shell 3: I still want to use virtualenv

---

# Show and Tell

1. Nix Shell
2. `devenv`
3. Nix Flakes
4. Flake Templates and Migrating an existing python project to Nix and Flakes

## devenv

To install devenv

```
nix profile install --accept-flake-config tarball+https://install.devenv.sh/latest
```

Create a new folder for your project and run:

```
devenv init
```

---

# Show and Tell

1. Nix Shell
2. `devenv`
3. Nix Flakes
4. Flake Templates and Migrating an existing python project to Nix and Flakes

## devenv

- Let's look ot the files it created and look at `devenv.nix` in detail
- And have `python` setup

---

# Show and Tell

1. Nix Shell
2. `devenv`
3. Nix Flakes
4. Flake Templates and Migrating an existing python project to Nix and Flakes

## devenv

### We want postgres as a service

```
services.postgres = {
    enable = true;
    initialDatabases = [{ name = "pybaydb"; }];
  };
```

To start our services we do:

```
devenv up
```

---

# Show and Tell

1. Nix Shell
2. `devenv`
3. Nix Flakes
4. Flake Templates and Migrating an existing python project to Nix and Flakes

## devenv

### We want to use `venv` or `poetry`

### I want to organize my bash scripts

### I want pre-commit to check my work


---

# Show and Tell

1. Nix Shell
2. devenv
3. `Nix Flakes`
4. Flake Templates and Migrating an existing python project to Nix and Flakes

## Nix Flakes

### What are Flakes?

- Package management for your project 
- Conventions on how to build, run and deploy your project
- cross platform
- Has a distinct schema
- It's not yaml 😂😂😂

---

# Show and Tell

1. Nix Shell
2. devenv
3. `Nix Flakes`
4. Flake Templates and Migrating an existing python project to Nix and Flakes

## Nix Flakes

Now let's take a look at using flakes for a python project

### I Will Show

- `nix develop`
- `nix run`
- None python dependencies available
- `nix flake show`
- `nix flake info`
- `nix flake check`

---

# Show and Tell

1. Nix Shell
2. devenv
3. Nix Flakes
4. `Flake Templates and Migrating an existing python project to Nix and Flakes`

- What are Flake Templates?
- How Do we migrate our existing Python Projects?
- I love poetry and don't want to stop using it?

---

# Show and Tell

1. Nix Shell
2. devenv
3. Nix Flakes
4. `Flake Templates and Migrating an existing python project to Nix and Flakes`

## Let's create a Python Project with poetry 

First we create the project 

```
nix-shell -p poetry --command "poetry new PyBay23Project"
```

then let's add a dependency

```
nix-shell -p poetry --command "poetry add attrs"
```

Let's make it a git repo

```
git init
```

```
git add -A :/ 
```

## Let's use a flake template and run these and take a look 

```
nix flake show templates
```

then

```
nix flake init --template templates#python
```

---

# Show and Tell

1. Nix Shell
2. devenv
3. Nix Flakes
4. Flake Templates and Migrating an existing python project to Nix and Flakes
5. `Bonus` - if time

## Nix Flakes

Now let's combine using `flakes` and `devenv` together

---

# Show and Tell

1. Nix Shell
2. devenv
3. Nix Flakes
4. Flake Templates and Migrating an existing python project to Nix and Flakes
5. `Bonus` - if time

## Home Manager


---

# Show and Tell

1. Nix Shell
2. devenv
3. Nix Flakes
4. Flake Templates and Migrating an existing python project to Nix and Flakes
5. `Bonus` - if time

## NixOS

---

# BACK TO SLIDES 

