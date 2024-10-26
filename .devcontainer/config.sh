#!/bin/sh

# Variables for the token and username (replace YOUR_TOKEN and YOUR_USER_NAME as needed)
ORT_AUTH_TOKEN="YOUR_GITHUB_TOKEN"
ORT_AUTH_USER="YOUR_GITHUB_USERNAME"

# Create the .netrc file
cat <<EOL > ~/.netrc
machine github.com
login $ORT_AUTH_USER
password $ORT_AUTH_TOKEN
EOL

# Create the folder structure
mkdir -p ~/.ort/config

# Create the config.yml file with the specified content in .ort/config/
cat <<EOL > ~/.ort/config/config.yml
ort:
  # Force overwriting of any existing output files.
  forceOverwrite: true
  analyzer:
    allowDynamicVersions: true
  ORT_AUTH_TOKEN: $ORT_AUTH_TOKEN
  ORT_AUTH_USER: $ORT_AUTH_USER
  enableRepositoryPackageCurations: true

  scanner:
    config:
      ScanCode:
        options:
          commandLine: '--copyright --license --timeout 3600'
EOL

echo "~/.ort/config/config.yml has been created successfully."

# Create the curations.yml file with the specified content in .ort/config/
cat <<EOL > ~/.ort/config/curations.yml
- id: "PyPI::numpy:2.1.2"
  curations:
    comment: |
      The declared license is ambiguous. Map it according to the root license, see
      https://github.com/numpy/numpy/blob/main/LICENSE.txt
    declared_license_mapping:
      "BSD License": "BSD-3-Clause"
- id: "PyPI::pandas:2.2.2"
  curations:
    comment: |
      The declared license is ambiguous. Map it according to the root license, see
      https://github.com/pandas-dev/pandas/blob/main/LICENSE
    declared_license_mapping:
      "BSD License": "BSD-3-Clause"
- id: "PyPI::mysql-connector-python:8.4.0"
  curations:
    comment: |
      The declared license is ambiguous. Map it according to the root license, see
      https://github.com/mysql/mysql-connector-python/blob/trunk/LICENSE.txt
    declared_license_mapping:
      "GNU GPLv2 (with FOSS License Exception)": "GPL-2.0-only WITH Universal-FOSS-exception-1.0"
EOL

echo "~/.ort/config/curations.yml has been created successfully."
