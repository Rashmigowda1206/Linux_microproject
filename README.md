# Linux Infrastructure Deployment & Storage Monitoring System

**Course:** Linux System Administration (`E1ITA307`)  
**Department:** Department of Information Technology  
**School:** Alliance School of Advanced Computing, Alliance University, Bengaluru  
**Academic Year:** 2026–2027  

---

## 👥 Project Team

| Student Name | Registration Number |
| :--- | :--- |
| **Rashmi** | `2411021061295` |
| **Panchaksharayya** | `2411021061321` |
| **Apoorva P Keretot** | `24110210613161` |
| **S Darshan Sai** | `2411021061289` |

**Faculty Supervisor / Course Coordinator:** Prof. Ananthanagu U  
**Professor & Head of Department:** Dr. Shekhar R  

---

## 📌 Project Overview

This microproject delivers an automated Linux system administration, storage monitoring, and service management system implemented on Ubuntu Linux. The project automates key administrative tasks including:
- **System Resource Monitoring:** Tracking disk usage (`df -h`), memory consumption (`free -h`), and kernel information (`uname -a`).
- **Service Lifecycle Management:** Automated start, stop, and status inspection scripts for web applications (CivicAI).
- **Automated Backup & Disaster Recovery:** Creation of timestamped compressed tarballs (`tar -czf`), retention management, and integrity verification.
- **Scheduled Automation:** Continuous health checks and periodic reporting scheduled through Linux Cron (`crontab`).
- **Access Control & Security Verification:** Validation of POSIX file permissions, group isolation, and directory security.

---

## 📁 Repository Structure

```
.
├── config/
│   └── project.conf                   # Central configuration file with paths & thresholds
├── scripts/
│   ├── status.sh                      # Checks system metrics, resources, and service state
│   ├── start.sh                       # Starts the application service with logging
│   ├── stop.sh                        # Safely terminates running service processes
│   ├── backup.sh                      # Creates timestamped backup archives
│   ├── restore.sh                     # Verifies backup integrity and readiness
│   └── security_check.sh              # Audits file permissions and project security
├── project-evidence/
│   ├── 01_project_structure.png & .txt
│   ├── 02_system_information.png & .txt
│   ├── 03_disk_usage.png & .txt
│   ├── 04_memory_usage.png & .txt
│   ├── 05_script_permissions.png & .txt
│   ├── 06_application_build.png & .txt
│   ├── 07_system_status.png & .txt
│   ├── 08_start_service.png & .txt
│   ├── 09_stop_service.png & .txt
│   ├── 10_backup_creation.png & .txt
│   ├── 11_backup_verification.png & .txt
│   ├── 12_cron_schedule.png & .txt
│   ├── 13_cron_service.png & .txt
│   ├── 14_security_check.png & .txt
│   ├── 15_project_summary.png & .txt
│   └── VERIFICATION_REPORT.md         # Comprehensive verification report
├── Linux_Storage_Monitoring_System_Aligned_Report.docx  # 75-Page Complete Formal Report
└── README.md
```

---

## 🚀 Script Usage Guide

### 1. Check System Status
```bash
./scripts/status.sh
```

### 2. Start Application Service
```bash
./scripts/start.sh
```

### 3. Stop Application Service
```bash
./scripts/stop.sh
```

### 4. Create System Backup
```bash
./scripts/backup.sh
```

### 5. Verify Backup Integrity
```bash
./scripts/restore.sh
```

### 6. Perform Security Audit
```bash
./scripts/security_check.sh
```

---

## 📊 Verification & Evidence

All 15 verification tests were executed in the Ubuntu Linux environment and logged with corresponding screenshots and raw command outputs inside the [`project-evidence/`](./project-evidence/) folder. For detailed audit notes, see [`VERIFICATION_REPORT.md`](./project-evidence/VERIFICATION_REPORT.md).
