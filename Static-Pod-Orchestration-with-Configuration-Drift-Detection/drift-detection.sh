#!/bin/bash

# Path to the local manifest file
LOCAL_FILE="/etc/kubernetes/manifests/nginx-static-pod.yaml"

# GitHub repository URL
REPO_URL="https://github.com/RehanFazal77/Cloud-Native-Projects.git"

# Temporary directory for cloning
TEMP_DIR=$(mktemp -d)

# Clone the repository
echo "Cloning repository..."
git clone "$REPO_URL" "$TEMP_DIR" || { echo "Error: Unable to clone repository"; exit 1; }

# Path to the file in the cloned repository
REPO_FILE="$TEMP_DIR/nginx-static-pod.yaml"

# Compare the local file with the one in the cloned repository
if ! diff -q "$LOCAL_FILE" "$REPO_FILE" > /dev/null 2>&1; then
  echo "Configuration drift detected:"
  diff "$LOCAL_FILE" "$REPO_FILE"
  
  # Optionally, reconcile the drift automatically
  cp "$REPO_FILE" "$LOCAL_FILE"
  echo "Drift reconciled."
else
  echo "No configuration drift detected."
fi

# Clean up: remove the temporary directory
rm -rf "$TEMP_DIR"
echo "Temporary files cleaned up."i
