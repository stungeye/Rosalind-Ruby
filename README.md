# Rosalind Bioinformatics Challenges

Solving the [Rosalind bioinformatics challenges](http://rosalind.info) using Ruby with Minitest specs.

This is deliberate practice with test-driven problem solving.

All library code is in the [lib](https://github.com/stungeye/Rosalind-Ruby/tree/master/lib) folder. All specs are in the [spec](https://github.com/stungeye/Rosalind-Ruby/tree/master/spec) folder.

# Solved Challenges

1. Counting DNA Nucleotides - [Code](https://github.com/stungeye/Rosalind-Ruby/tree/master/challenges/Counting%20DNA%20Nucleotides) - [Details](http://rosalind.info/problems/dna/)
2. Transcribing DNA into RNA - [Code](https://github.com/stungeye/Rosalind-Ruby/tree/master/challenges/Transcribing%20DNA%20into%20RNA) - [Details](http://rosalind.info/problems/rna/)
3. Complementing a Strand of DNA - [Code](https://github.com/stungeye/Rosalind-Ruby/tree/master/challenges/Complementing%20a%20Strand%20of%20DNA) - [Details](http://rosalind.info/problems/revc/)
4. Computing GC Content - [Code](https://github.com/stungeye/Rosalind-Ruby/tree/master/challenges/Computing%20GC%20Content) - [Details](http://rosalind.info/problems/gc/)
5. Counting Point Mutations - [Code](https://github.com/stungeye/Rosalind-Ruby/tree/master/challenges/Counting%20Point%20Mutations) - [Details](http://rosalind.info/problems/hamm/)
6. Finding a Motif in DNA - [Code](https://github.com/stungeye/Rosalind-Ruby/tree/master/challenges/Finding%20a%20Motif%20in%20DNA) - [Details](http://rosalind.info/problems/subs/)
7. Enumerating Gene Orders - [Code](https://github.com/stungeye/Rosalind-Ruby/tree/master/challenges/Enumerating%20Gene%20Orders) - [Details](http://rosalind.info/problems/perm/)

# Development Journal

##Counting DNA Nucleotides

A single DNA class is developed.

####Internals

* The ordered list of nucleotides is implemented with a String.
* Base counting is performed when a DNA object is instantiated by way of a Hash.

####Specs

Includes 8 tests and 17 assertions.

##Transcribing DNA into RNA

A NucleicAcid class is refactored from the DNA class. DNA and RNA classes inherit from NucelicAcid.

####Internals

* NucleicAcid handles base transcription using gsub on the nucleotide String.
* NucleciAcid handles object comparison `==` using String equality.
* DNA and RNA implement symmetric to_rna and to_dna methods.

####Specs

Includes 19 tests and 36 assertions.

A Rakefile was added to handle multiple spec files.

##Complementing a Strand of DNA

DNA now includes a `to_reverse_complement` method that returns another DNA object.

####Internals

Reversal is done using String manipulation. The complementing is done using an Array mapping of the String.

####Specs

Includes 21 tests and 38 assertions.

##Computing GC Content

Refactored code such that all classes are part of a Rosalind module. Added a Fasta class to read FASTA strings. Added GC content percentage calculation to NucleicAcid.

####Internals

Parsed FASTA strings are stored as a hash. This makes retrieving by identifier easy, but sorting is a little awkward. 

####Specs

Includes 28 tests and 48 assertions.

##Counting Point Mutations

Added hamming distance method to NucelicAcid. Refactored all challenges such that the library and specs are now in the root folder, rather than duplicated within each challenge.

####Internals

To calculate the hamming distance I have one NucelicAcid object compare its bases with those of another NucelicAcid. It feels wrong to peak this deep inside another object, but I made myself feel better by comparing arrays fetched using a custom to_a method. So, at least I'm not directly inspecting the internal bases. Is there a more OO way to do this type of low level comparison?

####Specs

Includes 32 tests and 52 assertions.

##Finding a Motif in DNA

Added a find_substring_indexes method to NucelicAcid.

####Internals

Used Ruby's sub-string finding method [index](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-index) to find all the indexes of all occurances of a sub-string of DNA within another DNA string.

####Specs

Includes 34 tests and 56 assertions.

##Enumerating Gene Orders

Stand-alone program developed find all permutations of integer sets of length n.

####Internals
 
Ruby's Array class contains [a method](http://www.ruby-doc.org/core-1.9.3/Array.html#method-i-permutation) that returns an enumerator of array permuations. Nice.

####Specs

Stand-alone program developed without tests using a built in Ruby method.

# Unlicense

This is free and unencumbered software released into the public domain.  See UNLICENSE for details.