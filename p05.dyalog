⎕IO←0
p←⊢⌿⍎¨⎕CSV'p05.txt'
r←{
    state←⍵ ⋄ sel←{⍺=0:state[⍵] ⋄ ⍵}
    ops←99,⍨1+⍳8 ⋄ offs←4 4 2 2 3 3 4 4 1
    op p1 p2 p3←4↑⍺↓⍵ ⋄ m3 m2 m1 o1 o2←op⊤⍨5⍴10
    op←10⊥o1 o2 ⋄ n j←(⍺∘+,-∘1)offs⌷⍨ops⍳op
    d1 d2 d3←3↑sel/j↑m1 m2 m3,⍪p1 p2 p3
    op∊1 2:n∇((op-1)⌷d1(+,×)d2)@p3⊢⍵
    op=3:n∇inp@p1⊢⍵ ⋄ op=4:d1,n∇⍵
    op∊5 6:⍵∇⍨n d2⌷⍨(op-5)⌷d1(≠,=)0
    op∊7 8:n∇((op-7)⌷d1(<,=)d2)@p3⊢⍵
    op=99:⍬
}
inp←1 ⋄ ¯1↑0 r p ⍝ part 1
inp←5 ⋄ 0 r p ⍝ part 2
