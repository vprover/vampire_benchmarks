;; From [Bjørner, Hozzová 2025]
(set-logic UF)
(set-feature :recursion true)

(declare-sort S 0)

(declare-var a S)
(declare-var u S)


(synth-fun fy ((a S)) S)

(constraint (=> (= u a) (= u (fy a))))

(check-synth)
