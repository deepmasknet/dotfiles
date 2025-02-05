# Dotfiles - Automated Setup for New Fedora Device

This repository contains configuration files and custom scripts

## **Prerequisites**
- A linux machine with `git` and `stow` installed.
- SSH access to GitHub (for cloning the repository securely).

## **Step 1: Clone the Repository**
Clone this repository into your home directory:
```bash
cd ~
git clone --recursive git@github.com:deepmasknet/dotfiles.git
```

## **Step 2: Symlink Configuration Files using GNU Stow**
```bash
cd ~/dotfiles
stow -t ~ .config
stow -t ~ scripts
```
This ensures all configs and scripts are properly linked to their expected locations

## **Step 3: Install Required Packages**
```bash
~/dotfiles/scripts/install-packages.sh
```
(Modify `install-packages.sh` to match your preferred software.)

## **Step 4: Verify i3 Configuration**
```bash
i3-msg restart
```
Check if keybindings and scripts work correctly.

## **Step 5: Accessing the Repository on New and Existing Devices**
### **Accessing the Repository on a New Device**
```bash
# Generate a new SSH key if needed
ssh-keygen -t ed25519 -C "your_email@example.com"

# Copy the SSH key to GitHUb
cat ~/.ssh/id_ed25519.pub

# Clone the repository
cd ~
git clone --recursive git@github.com:deepmasknet/dotfiles.git

# Follow Steps 2-4 to complete setup
```

### **Accessing the Repository on an Existing Device**
```bash
cd ~/dotfiles
git pull origin master
```

## **Step 6: Pulling and Pushing Changes
### **Pulling Changes from GitHub
```bash
cd ~/dotfiles
git pull origin master
```

### **Pushing Changes to GitHub**
```bash
# Stage all modified files
git add .

# Commit the changes
git commit -m "Updated configurations and scripts"

# Push the changes to the remote repository
git push origin master
```

## **Step 7: Updating and Maintaining Dotfiles
```bash
cd ~/dotfiles
git add .
git commit -m "Updated config files"
git push origin master
```

## Restoring a New Machine from Dotfiles
Follow Steps 1-7 on any new Fedora machine to replicate the environment.
