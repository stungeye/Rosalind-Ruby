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
8. Protein Translation - [Code](https://github.com/stungeye/Rosalind-Ruby/tree/master/challenges/Protein%20Translation) - [Details](http://rosalind.info/problems/prot/)
9. Finding a Shared Motif - [Code](https://github.com/stungeye/Rosalind-Ruby/tree/master/challenges/Finding%20a%20Shared%20Motif) - [Details](http://rosalind.info/problems/lcs/)

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

##Protein Translation

Added a new parent class for NucleicAcid called Sequence. This also became the parent to a new Protein class. Added the ability for RNA to be translated to a Protein string.

####Internals

When I moved some of the guts of NucleicAcid into Sequence I used a dash of metaprogramming. I had the class automatically define a number of count methods for each of the allowed symbols for the type of sequence. For example, DNA would automatically get a count_A, count_G, count_C and count_T.

The protein translation itself was accomplish by looping through the RNA codons (three bases at a time using a RegExp) and mapping to amino acids by way of a hash constant.

####Specs

Includes 39 tests and 95 assertions.

##Finding a Shared Motif

Added a helper method as a Sequence class method for finding a common substring. 

####Internals

String manipulation / traversal to find the long common substring. Initially I had the internals of the search manipulating Sequences, rather than strings, but the object creation overhead made the method incredibly slow.

The lcs method assumes that all the sequences passed by way of its argument array are of the same class. It uses the class of the shortest sequence as the return type for the located sequence.

####Specs

Includes 42 tests and 98 assertions.

# Unlicense

This is free and unencumbered software released into the public domain.  See UNLICENSE for details.