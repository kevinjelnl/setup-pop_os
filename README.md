# Pop!_OS COSMIC workstation setup

An Ansible-based setup for rebuilding a Pop!_OS COSMIC workstation. The repository is intended to be repeatable: system changes belong here so they can be applied to a new device later.

## Responsibilities

- **Ansible:** system packages, repositories, applications, COSMIC configuration, keyboard settings, SSH setup, and other Pop!_OS-specific configuration.
- **yadm:** portable user dotfiles, shell configuration, and WSL setup.

Ansible installs and clones yadm, but yadm remains independently usable in WSL.

## Initial setup

Clone the repository and enter it:

```bash
git clone https://github.com/kevinjelnl/setup-pop_os.git
cd setup-pop_os
git switch cosmic
```

Install the Ansible prerequisites:

```bash
./scripts/1-after_clean_install.sh
```

Apply the workstation configuration:

```bash
make setup
```

The playbook will prompt for the sudo password. After Ansible clones the dotfiles repository, run the interactive yadm bootstrap separately:

```bash
make bootstrap
```

## Make targets

```text
make setup       Apply the complete Ansible playbook
make remove      Remove packages listed in packages_to_remove
make bootstrap   Run the interactive yadm bootstrap
```

Run an individual role with Ansible tags:

```bash
ansible-playbook -i ansible/inventory.yml ansible/playbook.yml \
  --ask-become-pass --tags cosmic
```

Available role tags include:

- `packages`
- `waterfox`
- `proton`
- `cosmic`
- `alacritty`
- `leaf`
- `ssh_keygen`

## Package maintenance

Packages are managed in:

```text
ansible/roles/packages/defaults/main.yml
```

Add system packages to `packages_to_install` and unwanted APT packages to `packages_to_remove`. Flatpak removals are maintained in the package role tasks.

Application versions and download settings belong in the relevant role defaults, such as:

```text
ansible/roles/proton/defaults/main.yml
```

## COSMIC configuration

Selected COSMIC settings are stored in:

```text
ansible/roles/cosmic/files/.config/cosmic/
```

Only selected settings are managed; the complete runtime configuration directory is intentionally not copied.

## SSH key

The `ssh_keygen` role creates `~/.ssh/id_ed25519` once, without a passphrase. The private key remains on the machine and is never stored in this repository.

## Safety

Review changes before applying them:

```bash
ansible-playbook -i ansible/inventory.yml ansible/playbook.yml --syntax-check
git diff
```

Do not commit credentials, private keys, tokens, or other machine-specific secrets.
