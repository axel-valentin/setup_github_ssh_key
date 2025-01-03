#!/bin/bash

# Script to generate and configure an SSH key for GitHub

echo "=== Setting up an SSH key for GitHub ==="

# Step 1: Generate the SSH key
read -p "Enter your GitHub-associated email address: " email
ssh-keygen -t rsa -b 4096 -C "$email" -f ~/.ssh/id_rsa -N ""

if [ $? -eq 0 ]; then
    echo "SSH key generated successfully."
else
    echo "Error generating SSH key."
    exit 1
fi

# Step 2: Start the SSH agent
eval $(ssh-agent -s)

if [ $? -eq 0 ]; then
    echo "SSH agent started successfully."
else
    echo "Error starting the SSH agent."
    exit 1
fi

# Add the generated key to the SSH agent
ssh-add ~/.ssh/id_rsa

if [ $? -eq 0 ]; then
    echo "SSH key added to the agent successfully."
else
    echo "Error adding the SSH key to the agent."
    exit 1
fi

# Step 3: Copy the public SSH key to the clipboard
if command -v clip > /dev/null; then
    clip < ~/.ssh/id_rsa.pub
    echo "The public SSH key has been copied to your clipboard."
    echo "Please add it to GitHub under Settings > SSH and GPG Keys > New SSH Key."
else
    echo "The 'clip' command is not available. Here is your public SSH key:"
    cat ~/.ssh/id_rsa.pub
    echo "Copy this key and add it to GitHub under Settings / SSH and GPG Keys / New SSH Key."
fi

echo "=== Setup complete! ==="

