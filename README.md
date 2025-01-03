# setup_github_ssh_key

A Bash script to generate and configure an SSH key for GitHub. This script simplifies the process of creating an SSH key, adding it to the SSH agent, and copying the public key for use on GitHub.

## Instructions for Usage:

1. Clone the repository:

   ```bash
   git clone git@github.com:axel-valentin/setup_github_ssh_key.git
   cd setup_github_ssh_key
   ```

2. Make the script executable:

   ```bash
   chmod +x setup_github_ssh_key.sh
   ```

3. Run the script:

   ```bash
   ./setup_github_ssh_key.sh
   ```

4. Follow the on-screen instructions:

   - Provide your email address associated with your GitHub account.
   - The script will generate an SSH key and start the SSH agent.
   - If the `clip` command is available, the public key will be copied to your clipboard automatically.

5. Add the SSH key to your GitHub account:
   - Open GitHub in your web browser.
   - Navigate to **Settings > SSH and GPG Keys > New SSH Key**.
   - Paste the public key from your clipboard into the **Key** field.
   - Give your key a recognizable title (e.g., "My Laptop").
   - Click **Add SSH Key**.

## Requirements

- Git Bash or any Bash-compatible terminal.
- SSH installed on your system.
- Optional: `clip` command for copying the public key to your clipboard (pre-installed on Windows with Git Bash).

## Troubleshooting

1. **Error: `clip` command not found**

   - If you see this error, your system doesn't support the `clip` command.
   - Instead, manually copy the contents of the public key file:
     ```bash
     cat ~/.ssh/id_rsa.pub
     ```
     Then copy the displayed key to your clipboard.

2. **Permission denied when running the script**

   - Ensure the script is executable:
     ```bash
     chmod +x setup_github_ssh_key.sh
     ```

3. **Unable to add the SSH key to GitHub**
   - Double-check the public key by displaying its contents:
     ```bash
     cat ~/.ssh/id_rsa.pub
     ```
   - Ensure the key is pasted correctly in GitHub.
