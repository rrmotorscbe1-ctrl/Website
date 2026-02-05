#!/bin/bash
set -e
echo "Installing npm packages..."
npm install
echo "Building the application..."
npm run build
echo "Build complete!"
