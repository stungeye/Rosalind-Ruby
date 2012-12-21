## Rosalind Bioinformatics Challenges

Solving the [Rosalind bioinformatics challenges](http://rosalind.info) using Ruby with Minitest specs.

This is deliberate practice with test-driven problem solving. 

## Solved Challenges

1. Counting DNA Nucleotides - [Code](https://github.com/stungeye/Rosalind-Ruby/tree/master/Counting%20DNA%20Nucleotides) - [Details](http://rosalind.info/problems/dna/)
2. Transcribing DNA into RNA - [Code](https://github.com/stungeye/Rosalind-Ruby/tree/master/Transcribing%20DNA%20into%20RNA) - [Details](http://rosalind.info/problems/rna/)
3. Complementing a Strand of DNA - [Code](https://github.com/stungeye/Rosalind-Ruby/tree/master/Complementing%20a%20Strand%20of%20DNA) - [Details](http://rosalind.info/problems/revc/)

## Development Journal

###Counting DNA Nucleotides

A single DNA class is developed.

####Internals

* The ordered list of nucleotides is implemented with a String.
* Base counting is performed when a DNA object is instantiated by way of a Hash.

####Specs

Includes 8 tests and 17 assertions.

###Transcribing DNA into RNA

A NucleicAcid class is refactored from the DNA class. DNA and RNA classes inherit from NucelicAcid.

####Internals

* NucleicAcid handles base transcription using gsub on the nucleotide String.
* NucleciAcid handles object comparison `==` using String equality.
* DNA and RNA implement symmetric to_rna and to_dna methods.

####Specs

Includes 19 tests and 36 assertions.

A Rakefile was added to handle multiple spec files.

###Complementing a Strand of DNA

DNA now includes a `to_reverse_complement` method that returns another DNA object.

####Internals

Reversal is done using String manipulation. The complementing is done using an Array mapping of the String.

####Specs

Includes 21 tests and 38 assertions.

