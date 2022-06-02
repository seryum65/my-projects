#!/bin/bash
#
# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.

# (root:x:0:0:root:/root:/bin/bash ---In a Unix-like terminal, if the user has root user privilege, then echo $UID will return 0---)
if [[ "${UID}" -ne 0 ]] 
then
   echo 'You need to run with root user privilege.'
   exit 
fi

# Get the username (login).
read -p 'Enter the username to create: ' USER_NAME

# Get the real name (contents for the description field).
read -p 'Enter the name of the person or application that will be using this account: ' DESCRIPTION

# Get the password.
read -sp 'Enter the password to use for the account: ' PASSWORD

# Create the account.
useradd -m -c "${DESCRIPTION}" ${USER_NAME} 2> /dev/null 

# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.
if [[ "${?}" -ne 0 ]]
then
  echo 'This username is already exit. Please select different username '
  exit 1
fi

# Set the password.
echo -e "${PASSWORD}\n${PASSWORD}\n" | sudo passwd ${USER_NAME}  2> /dev/null 

# -e is to recognize \n as new line.

# sudo is root access for Ubuntu.

# The double quotes are to recognize $ and expand the variables.

# The above command passes the password and a new line, two times, to passwd, which is what passwd requires.

# Check to see if the passwd command succeeded.
if [[ "${?}" -ne 0 ]]
then
  echo 'The password for the account could not be set.'
  exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created.
echo
echo -e 'username:' "${USER_NAME}\n"
echo -e 'password:' "${PASSWORD}\n"

