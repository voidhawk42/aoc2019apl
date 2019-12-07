⎕IO←0
p←⊢⌿⍎¨⎕CSV'p07.txt'
r←{
    mem←mems[⍵;] ⋄ sel←{⍺=0:mem[⍵] ⋄ ⍵}
    ops←99,⍨1+⍳8 ⋄ offs←4 4 2 2 3 3 4 4 1
    inp←⊃⊃⍵⌷inps ⋄ ic←⍵⌷ics
    op p1 p2 p3←4↑ic↓mem ⋄ m3 m2 m1 o1 o2←op⊤⍨5⍴10
    op←10⊥o1 o2 ⋄ n j←(ic∘+,-∘1)offs⌷⍨ops⍳op
    d1 d2 d3←3↑sel/j↑m1 m2 m3,⍪p1 p2 p3 ⋄ ics[⍵]⊢←n
    op∊1 2:∇ ⍵⊣mems[⍵;p3]⊢←(op-1)⌷d1(+,×)d2
    (op=3)∧⍬≡⊃⍵⌷inps:ics[⍵]⊢←ic
    op=3:∇ ⍵⊣inps[⍵]↓⍨∘⊃←1⊣mems[⍵;p1]⊢←inp
    op=4:∇ ⍵⊣inps[5|⍵+1],∘⊃←d1
    op∊5 6:∇ ⍵⊣ics[⍵]⊢←n d2⌷⍨(op-5)⌷d1(≠,=)0
    op∊7 8:∇ ⍵⊣mems[⍵;p3]⊢←(op-7)⌷d1(<,=)d2
    op=99:h[⍵]⊢←1
}
mems ics h inps←4⍴⊂⍬ ⋄ prms←{1≥≢⍵:↑,↓⍵ ⋄ ↑⍪/⍵,∘∇¨⍵∘~¨⍵}
init←{mems⊢←↑5⍴⊂p ⋄ ics h⊢←2⍴⊂5⍴0 ⋄ inps[0],∘⊃←0⊣inps⊢←,¨⍵}
⌈/{⊃∊inps⊣r¨⍳5⊣init ⍵}¨↓prms ⍳5 ⍝ part 1
⌈/{⊃∊inps⊣{5|⍵+1⊣r ⍵}⍣{∧/h}⊢0⊣init ⍵}¨↓prms 5+⍳5 ⍝ part 2
