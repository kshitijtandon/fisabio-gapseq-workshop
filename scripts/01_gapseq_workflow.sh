#!/bin/bash

set -euo pipefail

cd data

echo "Step 1: gapseq find"

gapseq find \
  -p all \
  -b 200 \
  -m auto \
  -t auto \
  -K 24 \
  ecoli_k12.faa.gz

echo "Step 2: gapseq find-transport"

gapseq find-transport \
  ecoli_k12.faa.gz

echo "Step 3: gapseq draft"

gapseq draft \
  -r ecoli_k12-all-Reactions.tbl \
  -t ecoli_k12-Transporter.tbl \
  -p ecoli_k12-all-Pathways.tbl \
  -b Gram_neg \
  -n ecoli_k12 \
  -u 200 \
  -l 100

echo "Step 4: gapseq fill"

gapseq fill \
  -m ecoli_k12-draft.RDS \
  -n MM_glu.csv \
  -c ecoli_k12-rxnWeights.RDS \
  -g ecoli_k12-rxnXgenes.RDS \
  -b 100
