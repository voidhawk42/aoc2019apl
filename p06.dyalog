⍝ requires dfns.dws
p←')'(≠⊆⊢)¨⊃⎕NGET'p06.txt' 1
n←∪⊃,/p ⋄ g←(⊂⍬)⍴⍨≢n ⋄ m←{g[⍺]←⊂⍵,⊃⍺⌷g}
+/{1-⍨≢g path n⍳⍵ 'COM'}¨n⊣{(m⍨,m)/n⍳⍵}¨p ⍝ part 1
3-⍨≢g path n⍳'YOU' 'SAN' ⍝ part 2
