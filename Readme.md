# Reactome Pathway and GO Enrichment Analysis
### Overview
These scripts are designed to perform pathway and Gene Ontology (GO) enrichment analysis for proteins in the identified modules. The analysis is performed using the **Fisher's exact test** in the **Bioconductor package 'clusterProfiler'**.

### Key Steps:
1. **Input Data**: The input data file contains a list of proteins from the identified modules. This data is processed to find their associated pathways and GO terms.

2. **Mapping Proteins to Entrez IDs**: Since the `clusterProfiler` package requires **Entrez IDs** for analysis, we first map the input protein list to Entrez IDs. A seeded Entrez ID column is aligned with the protein list to ensure accurate mapping.

3. **Fisher's Exact Test**: The **Fisher's exact test** is used for enrichment analysis, which tests the overrepresentation of certain pathways or GO terms in the protein list compared to a reference set.

4. **Gene Symbol Conversion**: Once the enrichment analysis is completed, the Entrez IDs are converted back into their corresponding gene symbols for easier interpretation.

5. **Output for Cytoscape**: The final output of the enrichment analysis, with gene symbols and their associated pathways or GO terms, can be mapped into **Cytoscape** for visualization of the enriched pathways.

### Output
- The enriched pathways and GO terms are provided with their associated gene symbols.
- These results can be visualized in **Cytoscape**, offering an intuitive representation of the enrichment findings in relation to the protein modules.
