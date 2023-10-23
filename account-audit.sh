#!/bin/bash

# Define the output file path
output_file="/tmp/linux_user_group_sudo_info.txt"

# Create or truncate the output file
> "$output_file"

# Extract user information from /etc/passwd and /etc/shadow
awk -F: '{print "User: " $1 "\tUID: " $3 "\tGID: " $4 "\tHome: " $6 "\tShell: " $7}' /etc/passwd >> "$output_file"
awk -F: '{print "User: " $1 "\tPassword: " $2}' /etc/shadow >> "$output_file"

# Extract group information from /etc/group
awk -F: '{print "Group: " $1 "\tGID: " $3 "\tMembers: " $4}' /etc/group >> "$output_file"

# Extract sudo configuration
cat /etc/sudoers | grep -vE '^#|^$' | sed 's/[[:space:]]\+/ /g' | sed 's/^ //' >> "$output_file"

# Display a message indicating where the output is saved
echo "User, group, and sudo information has been extracted to $output_file"
extract_linux_info.sh
