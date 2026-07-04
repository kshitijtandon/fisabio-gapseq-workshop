#!/bin/bash

echo "Updating apt..."
apt-get update -qq

echo "Installing dependencies..."
apt-get install -y \
    ncbi-blast+ \
    hmmer \
    infernal \
    barrnap \
    bedtools \
    libxml2-utils \
    python3-pip

echo "Cloning gapseq..."
git clone https://github.com/jotech/gapseq.git

cd gapseq

echo "Downloading databases..."
bash download-db.sh

echo "Compiling..."
make

echo "Adding gapseq to PATH..."
echo 'export PATH=/content/fisabio-gapseq-workshop/gapseq/src:$PATH' >> ~/.bashrc
export PATH=/content/fisabio-gapseq-workshop/gapseq/src:$PATH

echo ""
echo "Installation finished."

gapseq --help