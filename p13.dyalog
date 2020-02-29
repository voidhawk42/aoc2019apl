⍝ Intcode computer
⎕FR ⎕PP ⎕IO←1287 34 0
mems inps rbs ics hlt blk←6⍴⊂⍬
id mcnt memlmt←0 2 5000
ops←99,⍨1+⍳9 ⋄ opd←ops∘⍳ ⋄ offs←4 4 2 2 3 3 4 4 2 1
fsel←{⍺=0:mems[id;⍵] ⋄ ⍺=2:mems[id;⍵+id⌷rbs] ⋄ ⍵}
dsel←{⍺=2:⍵+id⌷rbs ⋄ ⍵}
⍝ Args: Initial input
init←{
    inps⊢←mcnt⍴⊂⍬
    rbs ics hlt blk⊢←4⍴mcnt⍴⊂,0
    mems⊢←↑mcnt⍴⊂memlmt↑p ⋄ ⍬
}
⍝ Args: Output dest
run←{
    dest←⍵ ⋄ blk[id]←0
    {eval dest}⍣{(id⌷blk)∨id⌷hlt}0
}
⍝ Args: Output dest
eval←{
     inp←⊃⊃id⌷inps ⋄ ic←id⌷ics
     op p1 p2 p3←4↑mems[id;ic+⍳ic-⍨(memlmt-1)⌊ic+4]
     m3 m2 m1 o1 o2←op⊤⍨5⍴10
     op←10⊥o1 o2
     n j←(ic∘+,-∘1)offs⌷⍨opd op
     f1 f2 f3←3↑fsel/pm←j↑m1 m2 m3,⍤0⊢p1 p2 p3
     d1 d2 d3←3↑dsel/pm ⋄ ics[id]←n
     op∊1 2:mems[id;d3]←(op-1)⌷f1(+,×)f2
     (op=3)∧⍬≡⊃id⌷inps:ics[id]←ic⊣blk[id]←1
     op=3:inps[id]↓⍨←1⊣mems[id;d1]←inp
     op=4:inps[⍵],←f1
     op∊5 6:ics[id]←n f2⌷⍨(op-5)⌷f1(≠,=)0
     op∊7 8:mems[id;d3]←(op-7)⌷f1(<,=)f2
     op=9:rbs[id]+←f1
     op=99:hlt[id]←1
}

⍝ Day 13
p←⊢⌿⍎¨⎕CSV'p13.txt'
+/2=b/⍨0=3|1+⍳≢b←⊃1⌷inps⊣run 1⊣init 0 ⍝ part 1
p[0]←2 ⋄ s bx px←0 0 0
f←{{x y t←⍵ ⋄ t=4:bx⊢←x ⋄ t=3:px⊢←x ⋄ x y≡¯1 0:s⊢←t ⋄ ⍬}¨↓(3÷⍨≢⍵)3⍴⍵}
s⊣{inps[1]←⊂⍬⊣inps[0],←×bx-px⊣f⊃1⌷inps⊣run 1}⍣{0⌷hlt}init 0
