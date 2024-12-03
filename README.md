# perl-and-make

## Assignment.
Write a Perl program that calculates torsion angles for DNA and RNA
macromolecules. Compute the following angles: alpha, beta.

## Documentation.
PNA, α , γ. Jasiński, M. et al. (2018) Improved force fields for peptide
nucleic acids with optimized backbone torsion parameters.
Journal of Chemical Theory and Computation 14(7), 3603-3620.
American Chemical Society (ACS).
DOI: https://doi.org/10.1021/acs.jctc.8b00291

I found the exact torsion angle definitions in a separate publication,
where it says: "Torsion angle (deg) definitions:  α = C‘−N1‘−C2‘−C3‘;
β = N1‘−C2‘−C3‘−N4‘; γ = C2‘−C3‘−N4‘−C5‘"
Petersson, B. et al. (2005) Crystal Structure of a Partly Self-Complementary
Peptide Nucleic Acid (PNA) Oligomer Showing a Duplex−Triplex Network.
Journal of the American Chemical Society 127(5), 1424–1430.
American Chemical Society (ACS). DOI: https://doi.org/10.1021/ja0458726

## Running
The program runs through the Makefile, which after running will:
1) Download PDB files from www.rcsb.org using an ID file, log the download data;
2) Process each file - calculate the angles;
3) Remove intermediate files.
