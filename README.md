# ipset-persistent

## Installation

```sh
sudo ./install.sh
```

This script will:
- Install `ipset`
- Copy `ipset-persistent` to `/usr/sbin/`
- Set up a systemd service for automatic reload
- Create `/opt/ipsets` directory
- Enable the ipset service

## Usage

```sh
ipset-persistent reload
```
Reload all ipset sets from files in `/opt/ipsets`.
Files starting with `__` will be skipped and not reloaded.

```sh
ipset-persistent load-file <file_path>
```
Load ipset sets from a specified file.

```sh
ipset-persistent save
```
Save current ipset sets to `/opt/ipsets`.
All files in `/opt/ipsets` that do not contain a dot (`.`) in the filename and do not start with `__` will be deleted before saving.

