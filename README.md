# Linux SysAdmin & DevOps Practical Lab (CentOS)[cite: 1]

## Part 1 — Service Identity Setup

### Objective
Create a dedicated system service account with restricted login capabilities (`/sbin/nologin`) to securely own application resources on CentOS.

### Environment Setup
Set the unique service account identity[cite: 2]:
```bash
export SVC_NAME=bgdsvc_tazbir12
ExecutionRun the idempotent setup script:   Bashchmod +x 01_create_user.sh
./01_create_user.sh
Verified Terminal OutputPlaintextUser 'bgdsvc_tazbir12' created successfully.
uid=995(bgdsvc_tazbir12) gid=994(bgdsvc_tazbir12) groups=994(bgdsvc_tazbir12)
bgdsvc_tazbir12:x:995:994::/home/bgdsvc_tazbir12:/sbin/nologin
Technical Notesuseradd -r: Creates a system user account.   -s /sbin/nologin: Restricts interactive shell login for safety[cite: 3].Idempotency: Script checks id $SVC_NAME prior to user creation to safely prevent duplicate command failures[cite: 3].

## Part 2 — Fast RAM Scratch Space (tmpfs)

### Objective
Configure a 256MB high-speed, RAM-backed `tmpfs` storage space at `/mnt/${SVC_NAME}_tmp` owned by the service account to store temporary execution data safely without disk I/O bottlenecks.

### Execution
```bash
chmod +x 02_setup_tmpfs.sh
./02_setup_tmpfs.sh

Expected Output
Setting up tmpfs scratch space at: /mnt/bgdsvc_tazbir12_tmp
Mounting 256M tmpfs filesystem...
Setting permissions for bgdsvc_tazbir12...

--- Mount Verification ---
Filesystem      Size  Used Avail Use% Mounted on
tmpfs           256M     0  256M   0% /mnt/bgdsvc_tazbir12_tmp

Key Technical Notes
tmpfs: In-memory file system providing ultra-fast storage operations.

-o size=256M: Restricts memory allocation to 256MB max, preventing unexpected system RAM depletion.

Ownership: Assigned to bgdsvc_tazbir12 so the isolated service user can read/write data freely.