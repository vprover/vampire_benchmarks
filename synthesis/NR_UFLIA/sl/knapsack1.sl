;; From [Bjørner, Hozzová 2025]
(set-logic UFLIA)
(set-feature :recursion true)


(declare-var u1 Int)
(declare-var item1 Int)
(declare-var capacity Int)

(define-fun subspec ((i1 Int) (c Int) (x1 Int)) Bool (and (or (= x1 i1) (= x1 0)) (<= x1 c)))


(synth-fun fy1 ((item1 Int) (capacity Int)) Int)

(constraint (=> (and (>= capacity 0) (>= item1 0)) (and (subspec item1 capacity (fy1 item1 capacity)) (=> (subspec item1 capacity u1) (<= u1 (fy1 item1 capacity))))))

(check-synth)
