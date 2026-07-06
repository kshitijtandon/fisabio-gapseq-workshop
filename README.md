# FISABIO Workshop: Genome-Scale Metabolic Model Reconstruction using gapseq

[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/kshitijtandon/fisabio-gapseq-workshop/blob/main/notebooks/FISABIO_gapseq_workshop.ipynb)

This repository contains the materials for the **FISABIO Summer School** workshop on reconstructing **genome-scale metabolic models (GEMs)** from bacterial genomes using **gapseq**.

The workshop is designed as a hands-on Google Colab tutorial that demonstrates the complete reconstruction workflow, from genome sequence to a validated metabolic model.

---

# Learning outcomes

By completing this tutorial, participants will learn how to:

- Reconstruct a genome-scale metabolic model from a bacterial genome or metagenome-assembled genome (MAG).
- Identify metabolic reactions and pathways using **gapseq**.
- Predict transport proteins and transport reactions.
- Construct and gap-fill a draft metabolic model.
- Compare draft and gap-filled models using **COBRApy**.
- Assess model quality using **MEMOTE**.
- Understand how GEMs can be applied to microbiome research.

---

# Repository structure

```text
fisabio-gapseq-workshop/
├── notebooks/
│   └── FISABIO_gapseq_workshop.ipynb
├── data/
│   ├── genomes/                 # Genome or MAG FASTA files
│   ├── proteins/                # Protein FASTA files
│   ├── media/                   # Growth media (e.g. MM_glu.csv)
│   ├── gapseq_precomputed/      # Precomputed outputs from gapseq
│   └── models/                  # Draft and gap-filled metabolic models
├─slides/
├── scripts/
│   ├── 01_gapseq_workflow.sh    # Example HPC workflow
│   └── setup_gapseq_colab.sh    # Install gapseq and dependencies in Google Colab
└── README.md
```

---

# Getting started

## Option 1 (Recommended)

Launch the workshop directly in **Google Colab** using the badge above.

## Option 2

Clone the repository locally:

```bash
git clone https://github.com/kshitijtandon/fisabio-gapseq-workshop.git
cd fisabio-gapseq-workshop
```

---

# Example dataset

The workshop uses the well-characterised model organism:

**_Escherichia coli_ K-12 MG1655**

To keep the practical session focused on understanding the reconstruction workflow, all computationally intensive steps have been **precomputed** and are included in this repository.

---

# Reconstruction workflow

```text
Genome or MAG
      │
      ▼
Gene / protein prediction
      │
      ▼
gapseq find
      │
      ▼
Reaction & pathway prediction
      │
      ▼
gapseq find-transport
      │
      ▼
Transporter prediction
      │
      ▼
gapseq draft
      │
      ▼
Draft genome-scale metabolic model
      │
      ▼
Growth medium definition
      │
      ▼
gapseq fill
      │
      ▼
Gap-filled genome-scale metabolic model
      │
      ▼
COBRApy & MEMOTE
      │
      ▼
Model evaluation and interpretation
```

---

# Software used

This workshop uses the following software:

- **gapseq** – reconstruction of genome-scale metabolic models from bacterial genomes.
- **COBRApy** – loading, analysing and simulating metabolic models using constraint-based modelling.
- **MEMOTE** – standardised quality assessment of genome-scale metabolic models.

---

# References

- **gapseq**  
  Zimmermann J, Kaleta C, Waschina S. *gapseq: informed prediction of bacterial metabolic pathways and reconstruction of accurate metabolic models.* Genome Biology (2021). https://doi.org/10.1186/s13059-021-02295-1

- **COBRApy**  
  Ebrahim A, Lerman JA, Palsson BO, Hyduke DR. *COBRApy: COnstraints-Based Reconstruction and Analysis for Python.* BMC Systems Biology (2013). https://doi.org/10.1186/1752-0509-7-74

- **MEMOTE**  
  Lieven C, et al. *MEMOTE for standardized genome-scale metabolic model testing.* Nature Biotechnology (2020). https://doi.org/10.1038/s41587-020-0446-y

---

# Acknowledgements

Workshop materials developed by

- **Dr Kshitij Tandon**
- **Dr. Vanessa R Marcelino**

for the **FISABIO Summer School**.

---

# Citation

If you use these workshop materials, please cite:

1. The original **gapseq** publication.
2. The **COBRApy** publication.
3. The **MEMOTE** publication.
4. This GitHub repository.

---

# License

This repository is distributed under the **MIT License**. See the `LICENSE` file for details.
