## Complementing a Strand of DNA: SOLVED

In DNA strings, symbols 'A' and 'T' are complements of each other, as are 'C' and 'G'.

The reverse complement of a DNA string s is the string sc formed by reversing the symbols of s, then taking the complement of each symbol (e.g., the reverse complement of "GTCA" is "TGAC").

**Given:** A DNA string s of length at most 1000 bp.

**Return:** The reverse complement sc of s.

#### Sample Dataset

    AAAACCCGGT

#### Sample Output

    ACCGGGTTTT
    
Details here: [Complementing a Strand of DNA](http://rosalind.info/problems/revc/)
    
## Testing and Running the Code

Run the test suite:

    rake test
    
Process a file containing DNA strings:

    ruby main.rb < rosalind_dna.txt
    
## Unlicense

This is free and unencumbered software released into the public domain.  See UNLICENSE for details.
