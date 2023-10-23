# Define the source file on the Linux machine
source_file="/path/to/source.txt"

# Define the destination on the Windows machine
# Replace 'username' with your Windows username and 'hostname' with your Windows machine's IP address or hostname
destination="username@hostname:/path/to/destination"

# Use scp to copy the file to the Windows machine
scp "$source_file" "$destination"

# Check the exit status of scp to determine if the copy was successful
if [ $? -eq 0 ]; then
    echo "File copied successfully."
else
    echo "File copy failed."
fi
