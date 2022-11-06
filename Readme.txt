Reactome pathway and GO enrichment Analysis
===========================================
•	These scripts are used to find the pathway & GO enrichment analysis of all the proteins from the modules (see INPUT data file)
•	We used Fisher’s exact using  Bioconductor package ‘clusterprofile’ to perform enrichment. The package only identified the Entrez IDs for mapping, so we have seeded the Entrez IDs column that is aligned with the input protein list.
•	After the process is done, these Entrez IDs change to gene symbols again. Next, the output can be mapped  Cytoscape.

