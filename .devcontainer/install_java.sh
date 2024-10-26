#!/bin/bash

echo "Updating package index..."
sudo apt update
echo "Installing OpenJDK..."
sudo apt install -y openjdk-11-jdk

# Verify the installation
java -version

# Set JAVA_HOME environment variable (optional)
JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
echo "Setting JAVA_HOME to $JAVA_HOME"

# Add JAVA_HOME to .bashrc
echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bashrc
echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bashrc

# Apply the changes
source ~/.bashrc
echo "JAVA_HOME set successfully!"

# Reload bash configuration
source ~/.bashrc

# Verify installation
echo "Verifying Java installation..."
