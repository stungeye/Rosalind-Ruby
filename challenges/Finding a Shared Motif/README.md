## Finding a Shared Motif: SOLVED

A common substring of a collection of strings is a substring of every member of the collection. We say that a common substring is a longest common substring if a longer common substring of the collection does not exist. For example, CG is a common substring of ACGTACGT and AACCGGTATA, whereas GTA is a longest common substring. Note that multiple longest common substrings may exist.

**Given:** A collection of k DNA strings (of length at most 1 kbp each; k<=100).

**Return:** A longest common substring of the collection. (If multiple solutions exist, you may return any single solution.)

#### Sample Dataset

    GATTACA
    TAGACCA
    ATACA

#### Sample Output

    AC
    
Details here: [Finding a Shared Motif](http://rosalind.info/problems/lcs/)
    
## Testing and Running the Code

    ruby main.rb < roslind_lcs.txt
    
## Unlicense

This is free and unencumbered software released into the public domain.  See UNLICENSE for details.
