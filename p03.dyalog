p←','∘(≠⊆⊢)¨⊃⎕nget'p03.txt'1
d←↓(⊢⍪-)∘.=⍨⍳2
x←{↓+⍀⊃⍪/{(2,⍨⍎1↓⍵)⍴⊃d⌷⍨'URDL'⍳⊃⍵}¨⍵}¨p
⌊/+/|↑⊃i←∩/x ⍝ part 1
⌊/⊃+/i⍳⍨¨x ⍝ part 2
