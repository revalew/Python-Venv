#!/bin/bash

# Name of the virtual environment
ENV_NAME="watson_test"

# Create a new virtual environment
python -m venv $ENV_NAME

# Activate the virtual environment
source $ENV_NAME/bin/activate

# Install packages from requirements.txt
pip install -r requirements.txt

# Completion message
echo "The environment $ENV_NAME has been created and packages have been installed."
