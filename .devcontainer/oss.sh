#!/bin/sh
REPO_DIR="/workspaces/oss-review-toolkit"
ORT_DIR="$REPO_DIR/ort"

[ ! -d "$REPO_DIR/output" ] && mkdir -p $REPO_DIR/output

# Install NVM (Node Version Manager) if not already installed
if [ ! -d "/usr/local/share/nvm" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
fi

# Export and source NVM to ensure it's available in the current shell
export NVM_DIR="/usr/local/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # Load nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # Load nvm bash_completion

# Install Node.js version 20
# Check if Node.js version 20 is installed
if nvm ls 20 >/dev/null 2>&1; then
    echo "Node.js version 20 is already installed."
else
    echo "Node.js version 20 is not installed. Installing..."
    nvm install 20
fi

# Verify Node.js and npm versions
node -v  # Expected output: v20.18.0
npm -v   # Expected output: 10.8.2

# Install Yarn globally
# Check if Yarn is installed
if command -v yarn >/dev/null 2>&1; then
    echo "Yarn is already installed."
else
    echo "Yarn is not installed. Installing Yarn globally..."
    npm install -g yarn
    # Add Yarn to the PATH environment variable
    export PATH="$PATH:/root/.nvm/versions/node/$(node -v)/bin"
fi
# Verify Yarn version
yarn -v  # Expected output: yarn version number

cd $REPO_DIR/.devcontainer

# Check if Java is installed
if type java >/dev/null 2>&1; then
    echo "Java is already installed."
else
    echo "Java is not installed. Installing Java..."
    chmod -R 775 install_java.sh
    ./install_java.sh
fi
java -version

cd $REPO_DIR
# Check if the repository directory exists
if [ -d "$ORT_DIR" ]; then
    echo "Repository '$ORT_DIR' already exists. Skipping clone."
else
    echo "Cloning the ort repository tag 34.0.0"
    git clone --recurse-submodules --depth 1 --branch 34.0.0 https://github.com/oss-review-toolkit/ort.git

    # Update permission
    cd $ORT_DIR
    chmod -R 775 .
    git config core.fileMode false

    # Build ort
    ./gradlew installDist
fi

cd $ORT_DIR
cli/build/install/ort/bin/ort --help

cd $REPO_DIR
# Install scancode-toolkit
# Check if the repository directory exists
if [ -d "$REPO_DIR/scancode-toolkit" ]; then
    echo "Repository '$REPO_DIR/scancode-toolkit' already exists. Skipping clone."
else
    echo "Cloning scancode-toolkit"
    git clone --branch v32.2.1 --depth 1 https://github.com/aboutcode-org/scancode-toolkit.git
    cd $REPO_DIR/scancode-toolkit
    ./configure
fi

# Check if Yarn is installed
if command -h scancode >/dev/null 2>&1; then
    echo "Scancode is already linked."
else
    echo "Scancode is not linked. linking Scancode globally..."
    sudo ln -s $REPO_DIR/scancode-toolkit/scancode /usr/local/bin/scancode
fi

scancode -h

cd $REPO_DIR/.devcontainer
# Check if the directory already exists
if [ ! -d "~/.ort/config" ]; then
  chmod -R 775 config.sh
  ./config.sh
fi
