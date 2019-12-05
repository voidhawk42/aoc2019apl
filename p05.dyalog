⎕IO←0
p←⊢⌿⍎¨⎕CSV'p05.txt'

r←{
    state←⍵ ⋄ sel←{⍺=0:state[⍵] ⋄ ⍵}
    ops←1 2 3 4 5 6 7 8 99
    offs←4 4 2 2 3 3 4 4 1
    op p1 p2 p3←4↑⍺↓⍵
    m3 m2 m1 o1 o2←op⊤⍨5⍴10
    op←10⊥o1 o2 ⋄ n j←(⍺∘+,-∘1)offs⌷⍨ops⍳op
    p1_d p2_d p3_d←3↑sel/j↑m1 m2 m3,⍪p1 p2 p3
    op=1:n∇(p1_d+p2_d)@p3⊢⍵
    op=2:n∇(p1_d×p2_d)@p3⊢⍵
    op=3:n∇inp@p1⊢⍵
    op=4:p1_d,n ∇ ⍵
    op=5:⍵∇⍨(p1_d≠0)⌷n p2_d
    op=6:⍵∇⍨(p1_d=0)⌷n p2_d
    op=7:n∇(p1_d<p2_d)@p3⊢⍵
    op=8:n∇(p1_d=p2_d)@p3⊢⍵
    op=99:⍬
}

inp←1 ⋄ ¯1↑0 r p ⍝ part 1
inp←5 ⋄ 0 r p ⍝ part 2
