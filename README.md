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