# Project guidance

## Purpose

This repository rebuilds and configures a Pop!_OS COSMIC workstation with Ansible.

## Ownership

- Ansible owns Pop!_OS system packages, repositories, services, COSMIC settings, keyboard settings, and other system configuration.
- yadm owns portable user dotfiles and WSL setup.
- Do not manage yadm-owned files with Ansible.
- Pop!_OS-specific user configuration, such as COSMIC and Alacritty settings, belongs in Ansible roles.

## Structure

- `scripts/`: minimal bootstrap scripts only.
- `ansible/roles/`: idempotent, focused configuration roles.
- `ansible/roles/packages/`: central package installation and removal lists.
- `ansible/roles/cosmic/`: Pop!_OS COSMIC configuration.
- `to_be_deleted/`: obsolete files only; do not recreate it.

## Change conventions

- Make tasks idempotent and safe to rerun.
- Add package changes to the package role rather than shell scripts.
- Put configurable versions and URLs in role defaults.
- Tag roles so they can be run independently.
- Avoid hard-coded user home directories; use `dotfiles_home`.
- Run user-configuration tasks without privilege escalation.
- Do not commit credentials, private keys, tokens, or machine-specific secrets.
- Keep configuration changes small and reviewable.

## Validation

Use Ansible check mode where practical and review `git diff` before committing. Do not run destructive commands or remove installed software without explicit confirmation.
