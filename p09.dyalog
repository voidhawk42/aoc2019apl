⎕FR ⎕PP ⎕IO←1287 34 0
p←⊢⌿⍎¨⎕CSV'p09.txt'
ops←99,⍨1+⍳9 ⋄ opd←ops∘⍳ ⋄ offs←4 4 2 2 3 3 4 4 2 1
fsel←{⍺=0:mems[id;⍵] ⋄ ⍺=2:mems[id;⍵+id⌷rbs] ⋄ ⍵}
dsel←{⍺=2:⍵+id⌷rbs ⋄ ⍵}
r←{
     id⊢←⍵
     inp←⊃⊃⍵⌷inps ⋄ ic←⍵⌷ics
     op p1 p2 p3←4↑mems[id;ic+⍳ic-⍨4999⌊ic+4]
     m3 m2 m1 o1 o2←op⊤⍨5⍴10
     op←10⊥o1 o2
     n j←(ic∘+,-∘1)offs⌷⍨opd op
     f1 f2 f3←3↑fsel/pm←j↑m1 m2 m3,⍤0⊢p1 p2 p3
     d1 d2 d3←3↑dsel/pm ⋄ ics[⍵]←n
     op∊1 2:mems[⍵;d3]←(op-1)⌷f1(+,×)f2
     (op=3)∧⍬≡⊃⍵⌷inps:ics[⍵]←ic
     op=3:inps[⍵]↓⍨←1⊣mems[⍵;d1]←inp
     op=4:inps[⍺],←f1
     op∊5 6:ics[⍵]←n f2⌷⍨(op-5)⌷f1(≠,=)0
     op∊7 8:mems[⍵;d3]←(op-7)⌷f1(<,=)f2
     op=9:rbs[⍵]+←f1
     op=99:h[⍵]←1
}
inps←2⍴⊂⍬ ⋄ inps[0],←1 ⋄ id←0
mems←⍉⍪p ⋄ rbs←,0 ⋄ ics←,0 ⋄ h←,0
mems↑⍨⍤1←5000
∊inps⊣{1 r 0}⍣{1=0⌷h}0 ⍝ part 1
inps←2⍴⊂⍬ ⋄ inps[0],←2 ⋄ id←0
mems←⍉⍪p ⋄ rbs←,0 ⋄ ics←,0 ⋄ h←,0
mems↑⍨⍤1←5000
∊inps⊣{1 r 0}⍣{1=0⌷h}0 ⍝ part 2
