⎕IO←0 ⋄ p←⍎¨¯1↓⊃⎕NGET'p08.txt'
d←p⍴⍨6 25,⍨150÷⍨≢p
×/+/1 2∘.=,d⌷⍨(⊢⍳⌊/)+/+/0=d ⍝ part 1
' #'[⍉0 1(>/⍳)⍨⍤1⍉d] ⍝ part 2