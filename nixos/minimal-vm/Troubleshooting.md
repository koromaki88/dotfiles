# Troubleshooting
## Unexpected Disk Usage
### Problem: NixOS VM consuming excessive disk space

**Incident:** November 2026

The NixOS VM was consuming approximately **35 GB of disk space**, despite running Nix garbage collection and having relatively few user files.

Initial investigation revealed:

| Location | Disk Usage | Description |
|---|---:|---|
| `/nix/store` | 14 GB | Installed packages and dependencies |
| `/nix/var/nix/builds` | 17 GB | Temporary Nix build directories |
| `/home` | 3.8 GB | User files |
| `/var` | 275 MB | Logs and system data |
| **Total** | **35 GB** | |

**Root cause:** Approximately 17 GB had accumulated in `/nix/var/nix/builds`, likely from abandoned or retained build workspaces. The exact reason they remained was not established.

Normal Nix garbage collection did not remove these files because they were outside `/nix/store`.

### 1. Diagnose Disk Usage

Check overall filesystem usage:

```bash
df -hT /
```

Identify which directories consume the most space:

```bash
sudo du -xhd1 / 2>/dev/null | sort -h
```

If `/nix` is unusually large, inspect its subdirectories:

```bash
sudo du -xhd1 /nix 2>/dev/null | sort -h
sudo du -xhd2 /nix/var 2>/dev/null | sort -h
```

Compare the Nix store and build directory sizes:

```bash
sudo du -sh /nix/store /nix/var/nix/builds
```

Check the current system's dependency closure:

```bash
nix path-info -Sh /run/current-system
```

If `/nix/var/nix/builds` is unexpectedly large while the system is idle, investigate whether stale build directories remain.

### 2. Clean Up Abandoned Build Directories

**Warning:** Never delete build directories while Nix operations are running. Doing so can corrupt ongoing builds. Perform this procedure only after verifying that the build directories are abandoned.

**Step 1 — Check for running Nix operations**

```bash
pgrep -af 'nix-daemon|nix-build|nixos-rebuild|nix build'
```

An idle `nix-daemon` process is normal. Ensure no builds, rebuilds, or other Nix operations are active.

**Step 2 — Stop the Nix daemon**

```bash
sudo systemctl stop nix-daemon.socket nix-daemon.service
```

**Step 3 — Verify no active mounts remain**

```bash
findmnt -R /nix/var/nix/builds
```

If this lists mounts, **do not proceed with deletion** until they have been investigated and safely released.

**Step 4 — Remove abandoned build files**

Only if no builds are running and no mounts remain:

```bash
sudo find /nix/var/nix/builds -mindepth 1 -maxdepth 1 \
  -exec rm -rf --one-file-system -- {} +
```

This removes the contents of the build directory without deleting `/nix/store` or the build directory itself.

**Step 5 — Restart the Nix daemon**

```bash
sudo systemctl start nix-daemon.socket
```

**Step 6 — Verify reclaimed space**

```bash
df -h /
sudo du -sh /nix/var/nix/builds
```

In this incident, cleaning the abandoned build files reclaimed approximately **17 GB**.

### 3. Prevent Future Accumulation

Nix normally removes temporary build directories after builds complete. Failed or interrupted builds, or the `keep-failed` option, can result in directories being retained.

Check the configuration:

```bash
nix config show | grep -E '^(keep-failed|build-dir) ='
```

Ensure failed build directories are not intentionally retained:

```nix
nix.settings.keep-failed = false;
```

`keep-failed = false` is already the default. Explicitly setting it does not guarantee cleanup after abnormal termination.

Avoid scheduling automatic deletion of `/nix/var/nix/builds`, since it may contain active builds.

### 4. Nix Garbage Collection vs. Build Directory Cleanup

These operations serve different purposes.

| Command | Purpose |
|---|---|
| `sudo nix-collect-garbage -d` | Deletes old system generations and unreferenced store objects |
| `sudo nix store gc` | Removes unreachable Nix store objects |
| Manual build-directory cleanup | Removes abandoned temporary build workspaces after safety checks |

**Note:** Garbage collection cannot be relied upon to clean up `/nix/var/nix/builds`. Also, `nix-collect-garbage -d` removes old generations, reducing rollback options.

### 5. Quick Reference

When disk usage becomes unexpectedly high:

1. Run `df -hT /` to confirm usage.
2. Run `sudo du -xhd1 / | sort -h` to locate large directories.
3. Compare `/nix/store` with `/nix/var/nix/builds`.
4. If the build directory is large, verify there are no active Nix builds or mounts.
5. Follow the manual cleanup procedure above.
6. Verify the results with `df -h /`.

**Important:** Do not delete `/nix/store` manually. It contains Nix-managed package dependencies and system files.

**References:**

- [Nix Reference Manual — Build Directory Settings](https://nix.dev/manual/nix/2.35/command-ref/new-cli/nix3-help-stores.html)
- [Nix Reference Manual — Configuration](https://nix.dev/manual/nix/2.28/command-ref/conf-file)
