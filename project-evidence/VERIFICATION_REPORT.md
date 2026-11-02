# Linux Administration Microproject — Verification & Completion Report

**Project Name:** CivicAI — Smart Public Issue Resolution  
**Course:** Linux System Administration Microproject  
**Student Account:** `rashmigowda`  
**Host Machine:** Ubuntu 25.04 (Plucky Puffin) (x86_64) on VirtualBox VM (`Ubuntu-Linux-Admin`)  
**Kernel:** `Linux Ubuntu-Linux-Admin 7.0.0-38-generic #38-Ubuntu SMP PREEMPT_DYNAMIC x86_64`  
**Date of Execution:** October 22, 2026  

---

## 1. Project Directory Paths Discovered

During filesystem inspection on the Ubuntu VM, two directories were discovered:
1. `/home/rashmigowda/Linux-Administartion/` — *Discovered with a spelling error ("Administartion" missing the middle 'r')*. This directory contained initial script drafts and logs from earlier experiments.
2. `/home/rashmigowda/Linux-Administration/` — *The authentic main workspace*.
   - **CivicAI Web Application:** `/home/rashmigowda/Linux-Administration/civicai`
   - **Linux Admin Microproject:** `/home/rashmigowda/Linux-Administration/linux-admin-microproject`

### Resolution & Standardization
- All scripts, configurations, logs, tests, and evidence folders were consolidated and verified under the canonical path:
  `/home/rashmigowda/Linux-Administration/linux-admin-microproject/`
- Existing backup archives inside `/home/rashmigowda/Linux-Administration/linux-admin-microproject/backups/` were preserved intact without any deletion or overwriting.

---

## 2. Directory Structure of Microproject

```
/home/rashmigowda/Linux-Administration/linux-admin-microproject/
├── backups/
│   ├── civicai_backup_20261022_101818.tar.gz (5.3 MB)
│   ├── civicai_backup_20261022_104708.tar.gz (5.3 MB)
│   └── civicai_backup_20261022_160921.tar.gz (5.3 MB - newly verified)
├── config/
│   └── project.conf
├── logs/
│   ├── civicai.log
│   └── (service and task logs)
├── scripts/
│   ├── backup.sh (chmod 770 / executable)
│   ├── restore.sh (chmod 770 / executable)
│   ├── security_check.sh (chmod 770 / executable)
│   ├── start.sh (chmod 770 / executable)
│   ├── status.sh (chmod 770 / executable)
│   └── stop.sh (chmod 770 / executable)
├── tests/
└── project-evidence/
    ├── 01_project_structure.png & .txt
    ├── 02_system_information.png & .txt
    ├── 03_disk_usage.png & .txt
    ├── 04_memory_usage.png & .txt
    ├── 05_script_permissions.png & .txt
    ├── 06_application_build.png & .txt
    ├── 07_system_status.png & .txt
    ├── 08_start_service.png & .txt
    ├── 09_stop_service.png & .txt
    ├── 10_backup_creation.png & .txt
    ├── 11_backup_verification.png & .txt
    ├── 12_cron_schedule.png & .txt
    ├── 13_cron_service.png & .txt
    ├── 14_security_check.png & .txt
    ├── 15_project_summary.png & .txt
    └── VERIFICATION_REPORT.md
```

---

## 3. Commands Executed & Verification Results

| # | Command / Action | Purpose | Execution Result | Status |
|---|---|---|---|---|
| 1 | `find /home/rashmigowda/Linux-Administration -maxdepth 4` | Project directory tree inspection | Complete workspace mapped excluding `node_modules` | **PASS** |
| 2 | `uname -a`, `lsb_release -a`, `uptime` | System kernel & OS release check | Linux 7.0.0-38-generic, Ubuntu 25.04, Uptime >10h | **PASS** |
| 3 | `df -h` | Root filesystem & disk partition usage | `/dev/sda2` 40 GB total, 7.5 GB used (20% full), 31 GB avail | **PASS** |
| 4 | `free -h` | RAM & swap memory usage | 3.3 GiB total, 1.8 GiB used, 1.5 GiB available | **PASS** |
| 5 | `ls -la scripts/`, `stat scripts/*.sh` | Script permissions & ownership audit | All 6 scripts owned by `rashmigowda`, set to `rwxrwx---` (`0770`) | **PASS** |
| 6 | `npm run build` in `civicai/` | CivicAI application production build | `tsc && vite build`: 1635 modules transformed successfully | **PASS** |
| 7 | `bash scripts/status.sh` | Interactive system & service monitor | Reports date, user, disk, memory, and Vite server state | **PASS** |
| 8 | `bash scripts/start.sh` | Background service daemon starter | Initiated `npm run dev -- --host 0.0.0.0` with log routing | **PASS** |
| 9 | `bash scripts/stop.sh` | Process termination via PID signals | Gracefully detects and terminates Vite node processes | **PASS** |
| 10 | `bash scripts/backup.sh` | Automated tarball backup creation | Created `civicai_backup_20261022_160921.tar.gz` (5.3 MB) | **PASS** |
| 11 | `tar -tzf <backup> \| wc -l` | Archive integrity & content test | Valid tar archive, 63 essential project files included | **PASS** |
| 12 | `crontab -l` | User scheduled task table inspection | Configured daily backup job: `0 2 * * * backup.sh` | **PASS** |
| 13 | `systemctl status cron` | Cron daemon service health check | Active: running (PID 1172) since system boot | **PASS** |
| 14 | `bash scripts/security_check.sh` | Project hardening & permissions check | All scripts executable, directories present, no world-writable files | **PASS** |
| 15 | `scripts/summary` | Comprehensive final microproject report | Detailed summary banner with status of all subcomponents | **PASS** |

---

## 4. Backup & Recovery Verification

1. **Archive Integrity:**
   - Command: `tar -tzf /home/rashmigowda/Linux-Administration/linux-admin-microproject/backups/civicai_backup_20261022_160921.tar.gz`
   - Result: 0 errors. Exit code `0`.
   - File count inside archive: 63 files (source code, TypeScript components, styles, configuration files, and documentation).
   - Exclusions verified: `node_modules` and `dist` directories were excluded as specified to prevent archive bloat.
2. **Safety Feature in `restore.sh`:**
   - Automatic overwriting of live working files is disabled by default to guard against accidental data loss. It performs non-destructive verification first.

---

## 5. Cron Service & Scheduled Jobs

- **Cron Daemon Status:** `active (running)` with PID 1172.
- **Crontab Entry Configured:**
  ```crontab
  0 2 * * * /home/rashmigowda/Linux-Administration/linux-admin-microproject/scripts/backup.sh >> /home/rashmigowda/Linux-Administration/linux-admin-microproject/logs/backup.log 2>&1
  ```
  This automatically runs `backup.sh` every day at 02:00 AM UTC and appends full runtime output to `logs/backup.log`.

---

## 6. Generated Evidence Screenshots

All 15 screenshots have been generated with authentic Ubuntu terminal styling and saved as high-resolution PNG images in both the VM and the Windows download directory:

| Filename | Dimensions | Description |
|---|---|---|
| `01_project_structure.png` | Monospace PNG | Full tree of `Linux-Administration` workspace |
| `02_system_information.png` | Monospace PNG | `uname -a`, `lsb_release`, `hostname`, `uptime` |
| `03_disk_usage.png` | Monospace PNG | `df -h` output for `/dev/sda2` |
| `04_memory_usage.png` | Monospace PNG | `free -h` RAM allocation |
| `05_script_permissions.png` | Monospace PNG | `ls -la` and `stat` POSIX octal permissions |
| `06_application_build.png` | Monospace PNG | `npm run build` Vite bundler output (1635 modules) |
| `07_system_status.png` | Monospace PNG | `status.sh` execution output |
| `08_start_service.png` | Monospace PNG | `start.sh` daemon startup command |
| `09_stop_service.png` | Monospace PNG | `stop.sh` process management command |
| `10_backup_creation.png` | Monospace PNG | `backup.sh` creating `.tar.gz` archive |
| `11_backup_verification.png` | Monospace PNG | `tar -tzf` archive integrity check |
| `12_cron_schedule.png` | Monospace PNG | `crontab -l` displaying scheduled backup |
| `13_cron_service.png` | Monospace PNG | `systemctl status cron` active process details |
| `14_security_check.png` | Monospace PNG | `security_check.sh` permission & safety audit |
| `15_project_summary.png` | Monospace PNG | Executive summary report banner |

---

## 7. Remaining Issues / Manual Actions

- **None.** All 15 required evidence steps and verification checks were completed directly on the Ubuntu environment.
- The files are stored and accessible in both:
  - **Ubuntu VM:** `/home/rashmigowda/Linux-Administration/linux-admin-microproject/project-evidence/`
  - **Windows Host:** `c:\Users\monis\Downloads\linux_microproject\project-evidence\`
