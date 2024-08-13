# How to create and manage a virtual environment in Python

This repository contains various operations that can be performed on Python's venvs without using the Anaconda package manager, and serves as a quick reference I created for myself.

## Table of contents

- [Main section](#main-section)
  - [How to generate `requirements.txt` from current venv](#how-to-generate-requirementstxt-from-current-venv)
  - [Create the venv](#create-the-venv)
    - [Using a script](#using-a-script)
    - [Without the script](#without-the-script)
  - [Check if venv is active](#check-if-venv-is-active)
  - [Activate existing venv](#activate-existing-venv)
  - [Deactivate existing venv](#deactivate-existing-venv)
  - [Delete unused venv](#delete-unused-venv)
- [Bonus section](#bonus-section)
  - [Finding lost venv locations](#finding-lost-venv-locations)
  - [Add venv to path](#add-venv-to-path)

## Main section

### How to generate `requirements.txt` from current venv

- Activate desired venv (see [Activate existing venv](#activate-existing-venv)) or create new one (see [Create the venv](#create-the-venv)),
- `pip freeze > requirements.txt` this file will be generated in the current directory (a full file path will also work).

### Create the venv

#### Without the script

- Copy the `requirements.txt` to chosen directory,
- `python -m venv ENV_NAME`,
- `source ENV_NAME/bin/activate`,
- `pip install -r requirements.txt`,
- Terminal should change from `[root@hostname ~]# ` to `(ENV_NAME) [root@hostname ~]# ` indicating that the venv is now active.

#### Using a script

- Copy the `createPythonVenvRequirements.sh` and `requirements.txt` to chosen directory,
- Change the environment name (`ENV_NAME` variable) in `createPythonVenvRequirements.sh`,
- `chmod +x createPythonVenvRequirements.sh`,
- Run the bash script `./createPythonVenvRequirements.sh`,
- Terminal should change from `[root@hostname ~]# ` to `(ENV_NAME) [root@hostname ~]# ` indicating that the venv is now active.

### Check if venv is active

- Terminal should look like this `(ENV_NAME) [root@hostname ~]# ` indicating that the venv is now active,
- Alternatively try `echo $VIRTUAL_ENV` (this command also shows the localization of the venv).

### Activate existing venv

- Go to the directory where the venv is located (e.g., `cd /root/`),
- `source ENV_NAME/bin/activate`,
- Terminal should change from `[root@hostname ~]# ` to `(ENV_NAME) [root@hostname ~]# ` indicating that the venv is now active.

### Deactivate existing venv

- If the venv is active, use the command `deactivate` (see [Check if venv is active](#check-if-venv-is-active)).

### Delete unused venv

- Deactivate venv if it is still active using `deactivate` (see [Check if venv is active](#check-if-venv-is-active)),
- `rm -rf ENV_NAME` (`ENV_NAME` is the path to the venv e.g., `/root/ENV_NAME`).

## Bonus section

### Finding lost venv locations

In examples below `~/` is the home directory of the current user - adjust as needed.

1. Venv name IS known:

   - `find ~/ -type d -name "ENV_NAME"`

2. Venv name IS NOT known:

   - `find ~/ -type d -name "bin" | grep "/bin$"`

3. Search every folder containing `lib/python3.X/site-packages` which are characteristic for python venvs

   - `find ~/ -type d -name "site-packages"`

4. Check the bash history

   - `history | grep "python -m venv"`

5. Bash script: add additional steps when venv is found (e.g., echo etc.)
   ```bash
   for dir in $(find ~/ -type d -name "bin" | grep "/bin$"); do
     echo -e "\nFound venv in:\n\t$dir"
   done
   ```

### Add venv to path

- `export PATH="/ENV_PATH/ENV_NAME/bin:$PATH" >> ~/.bashrc` (adds this line to the end of `~/.bashrc` file),
- `source ~/.bashrc` (reads / updates the new PATH).
