#!/bin/bash
echo "Running"
eval "$(ssh-agent -s)" # Start ssh-agent cache
chmod 600 id_rsa # Allow read access to the private key
ssh-add id_rsa # Add the private key to SSH
ssh -o StrictHostKeyChecking=no "root@$IP"
git config --global push.default matching
git remote add deploy ssh://root@$IP$DEPLOY_DIR
git push deploy master