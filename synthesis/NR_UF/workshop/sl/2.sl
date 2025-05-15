;; From [Reger 2017]
(set-logic HO_UF)
(set-feature :recursion true)

(declare-sort S 0)

(declare-var workshop (-> S Bool))
(declare-var vampire S)
(declare-var arcade S)
(declare-var monday Bool)
(declare-var sunday Bool)

(assume (=> monday (workshop vampire)))
(assume (=> sunday (workshop arcade)))
(assume (or monday sunday))

(synth-fun fx ((workshop (-> S Bool)) (vampire S) (arcade S) (monday Bool) (sunday Bool)) S)

(constraint (workshop (fx workshop vampire arcade monday sunday)))

(check-synth)
