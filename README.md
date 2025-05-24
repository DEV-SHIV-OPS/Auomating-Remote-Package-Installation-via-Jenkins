# Jenkins-Based Remote Package Installation via SSH (CentOS 9)

This project documents a Jenkins Freestyle Job that automates remote package installation on a CentOS Stream 9 server using SSH, with parameterized input for flexibility.

Real-world tested: The job succeeded after multiple failed builds — proving that persistence, not perfection, delivers in DevOps.

---

## Objective

Automate package installation on a remote Linux server via:

- Jenkins Freestyle Job  
- Parameterized input (`PACKAGE`)  
- SSH remote command execution  
- OS-aware handling using `dnf` (CentOS)

---

## Jenkins Job Configuration

### Job Name

`install-packages`

### Build Parameter

- `PACKAGE` (String) – Name of the package to install (e.g., `htop`, `python3`)

### Build Step – Execute Shell

```bash
echo "Installing package: ${PACKAGE}"

sshpass -p 'YourSecurePassword' ssh -o StrictHostKeyChecking=no remote_user@remote_server_ip \
"echo 'YourSecurePassword' | sudo -S dnf install -y ${PACKAGE}"
