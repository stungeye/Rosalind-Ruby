## Transcribing DNA into RNA: SOLVED

An RNA string is a string formed from the alphabet containing 'A', 'C', 'G', and 'U'.

Given a DNA string t corresponding to a coding strand, its transcribed RNA string u is formed by replacing all occurrences of 'T' in t with 'U' in u.

**Given:** A DNA string t having length at most 1000 nt.

**Return:** The transcribed RNA string of t.

#### Sample Dataset

    GATGGAACTTGACTACGTAAATT

#### Sample Output

    GAUGGAACUUGACUACGUAAAUU
    
Details here: [Transcribing DNA into RNA](http://rosalind.info/problems/rna/)
    
## Testing and Running the Code

Run the test suite:

    rake test
    
Process a file containing RNA strings:

    ruby main.rb < rosalind_rna.txt
    
## Unlicense

This is free and unencumbered software released into the public domain.  See UNLICENSE for details.
