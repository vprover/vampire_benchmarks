;; From [Bjørner, Hozzová 2025]
(set-logic HO_UF)
(set-feature :recursion true)

(declare-sort S 0)

(declare-var a S)
(declare-var u S)
(declare-var f (-> S S))


(synth-fun fy ((a S) (f (-> S S))) S)

(constraint (=> (= (f u) a) (= (f u) (fy a f))))

(check-synth)
