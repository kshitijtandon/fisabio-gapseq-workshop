#!/bin/bash
set -e
START=$(date +%s)
echo "=============================="
echo "Installing Ubuntu dependencies"
echo "=============================="
apt-get update -qq
apt-get install -y -qq \
    git \
    wget \
    curl \
    ncbi-blast+ \
    bedtools \
    barrnap \
    bc \
    parallel \
    r-base-core \
    libglpk-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev
	libsbml5-dev \
	libsbml5 \
	pkg-config
echo "=============================="
echo "Cloning gapsed..."
echo "=============================="
if [ ! -d "gapseq" ]; then
    git clone https://github.com/jotech/gapseq.git
fi

cd gapseq

echo "=============================="
echo "Installing R dependencies..."
echo "=============================="
Rscript -e 'install.packages(c("data.table","stringr","getopt","doParallel","foreach","R.utils","stringi","glpkAPI","CHNOSZ","jsonlite","httr"), repos="https://cloud.r-project.org")'

Rscript -e 'if (!requireNamespace("BiocManager", quietly=TRUE)) install.packages("BiocManager", repos="https://cloud.r-project.org"); BiocManager::install("Biostrings", ask=FALSE, update=FALSE)'

Rscript -e 'install.packages("remotes", repos="https://cloud.r-project.org")'

Rscript -e 'remotes::install_github("Waschina/cobrar", upgrade="never")'

echo "Downloading gapseq sequence databases..."
bash ./src/update_sequences.sh

echo "Adding gapseq to PATH..."
chmod +x ./gapseq
export PATH="$(pwd):$PATH"

echo ""
echo "Installation finished."
echo ""
echo "Running gapseq self-test..."
./gapseq test
echo ""
echo "Installation successful!"

END=$(date +%s)
echo ""
echo "Installation completed in $((END-START)) seconds."