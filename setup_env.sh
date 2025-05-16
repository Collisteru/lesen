#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Name of the virtual environment directory
VENV_DIR="venv"

# Check if Python is installed
if ! command -v python3 &> /dev/null
then
    echo "Error: python3 is not installed."
    exit 1
fi

# Create virtual environment
echo "Creating virtual environment in ./$VENV_DIR ..."
python3 -m venv "$VENV_DIR"

# Activate virtual environment
echo "Activating virtual environment..."
source "$VENV_DIR/bin/activate"

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install requirements.txt
if [ -f "requirements.txt" ]; then
    echo "Installing packages from requirements.txt..."
    pip install -r requirements.txt
fi

echo "✅ Environment setup complete. Virtual environment located at ./$VENV_DIR"
