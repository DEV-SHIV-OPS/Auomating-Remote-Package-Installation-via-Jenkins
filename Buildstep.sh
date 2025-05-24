```bash
echo "Installing package: ${PACKAGE}"

sshpass -p 'YourSecurePassword' ssh -o StrictHostKeyChecking=no remote_user@remote_server_ip \
"echo 'YourSecurePassword' | sudo -S dnf install -y ${PACKAGE}"
