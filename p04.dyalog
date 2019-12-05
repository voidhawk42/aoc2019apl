p←197487 673251
r←{1-⍨⍺+⍳1+⍵-⍺} ⋄ b←{⍵⊤⍨6⍴10}
≢d←d/⍨{∧/(2≤/⍵),∨/2=/⍵}¨d←b¨⊃r/p ⍝ part 1
+/{∨/{0 1 0≡⍵}⌺3⊢2=/⍵}¨d ⍝ part 2

⍝ Nicer solution, w/ assistance from Jay Foad
s e←197487 673251
d←{≢⍵}⌸¨d/⍨(⍋≡⍳∘≢)¨d←⍕¨1-⍨s+⍳1+e-s
+/2≤⌈/¨d ⍝ part 1
+/2∊¨d ⍝ part 2
