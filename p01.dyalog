p←⍎¨⊃⎕nget'p01.txt'1
f←{2-⍨⌊⍵÷3} ⋄ +/f p ⍝ part 1
+/{0≥⍵:0 ⋄ ⍵+∇f⍵}¨f p ⍝ part 2
