i←(⊂'ORE'),⍨⊃¨⊢/¨⊢/p←↑{⍵∘(∊⊆⊣)¨(⊂⎕D),⊂⎕A}¨⊃⎕NGET'p14.txt'1
r←↑{(-@(≢⍺)-⍎¨⍺)@(i⍳⍵)⊢0⍴⍨≢i}/p
f←{{∧/0≤¯1↓⍵:-⊢/⍵ ⋄ ∇⍵+n×⌈-⍵[a]÷a⌷n←r⌷⍨a←⊃⍸0>⍵}⍵×r⌷⍨i⍳⊂'FUEL'}
f 1 ⍝ part 1
1{⍺=m←⌊2÷⍨⍺+⍵:⍺ ⋄ 1e12>f m:m∇⍵ ⋄ ⍺∇m}{1e12<f⍵:⍵ ⋄ ∇2×⍵}1 ⍝ part 2
