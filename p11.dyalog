⍝ Intcode computer
⎕FR ⎕PP ⎕IO←1287 34 0
mems inps rbs ics hlt blk←6⍴⊂⍬
id mcnt memlmt←0 2 5000
ops←99,⍨1+⍳9 ⋄ opd←ops∘⍳ ⋄ offs←4 4 2 2 3 3 4 4 2 1
fsel←{⍺=0:mems[id;⍵] ⋄ ⍺=2:mems[id;⍵+id⌷rbs] ⋄ ⍵}
dsel←{⍺=2:⍵+id⌷rbs ⋄ ⍵}
⍝ Args: Initial input
init←{
    inps⊢←mcnt⍴⊂⍬ ⋄ inps[0],←⍵
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

⍝ Day 11
p←⊢⌿⍎¨⎕CSV'p11.txt' ⋄ d←↓(⊢⍪-)∘.=⍨⍳2
v←,pos←⊂0 0 ⋄ cd←0 ⋄ c←,0
f←{
    nc nd←⊃1⌷inps ⋄ c[v⍳pos]←nc
    cd⊢←4|cd+nd⌷¯1 1 ⋄ pos⊢←pos+cd⌷d
    ~pos∊v:c,←0⊣v,←pos ⋄ ⍬
}
g←{inps[1]←⊂⍬⊣f 0⊣run 1 ⋄ inps[0]←c⌷⍨v⍳pos}
≢v⊣g⍣{0⌷hlt}⊢init 0 ⍝ part 1

v←,pos←⊂0 0 ⋄ cd←0 ⋄ c←,1
g⍣{0⌷hlt}⊢init 1
w←(⊢+∘|⌊/)c/v ⋄ m←0⍴⍨⊃1+⌈/w
⊖' #'[1@w⊢m] ⍝ part 2
