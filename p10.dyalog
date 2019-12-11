⎕IO←0 ⋄ 'polar'⎕CY'dfns' ⋄ p←⌽¨⍸'#'=↑⊃⎕NGET'p10.txt'1
⌈/x←≢∘∪⍤1(,÷∨)/r←↑{⍵~⊂0 0}⍤1∘.-⍨p ⍝ part 1
l a←↓polar⍉1 ¯1×⍤1⌽r⌷⍨i←⊃⍒x
∊⍕¨⊃199⌷(p~i⌷p)[1-⍨0~⍨,⍉↑1+{⍵[⍋l[⍵]]}¨⊢/{⍵[⍋⍵;]},∘⊂⌸a] ⍝ part 2

⍝ ...alternatively, we can use polar coordinates from the start
⌈/i←≢∘∪⍤1⊢/r←⍉polar⍉1 ¯1×⍤1⌽↑{⍵~⊂0 0}⍤1∘.-⍨p ⍝ part 1
l a←↓⍉r⌷⍨i←⊃⍒x
∊⍕¨⊃199⌷(p~i⌷p)[1-⍨0~⍨,⍉↑1+{⍵[⍋l[⍵]]}¨⊢/{⍵[⍋⍵;]},∘⊂⌸a] ⍝ part 2
