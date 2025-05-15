;; Based on [Bjørner, Hozzová 2025]
(set-logic UFLRA)
(set-feature :recursion true)


(declare-var u1 Real)
(declare-var item1 Real)
(declare-var capacity Real)

(define-fun subspec ((i1 Real) (c Real) (x1 Real)) Bool (and (or (= x1 i1) (= x1 0)) (<= x1 c)))


(synth-fun fy1 ((item1 Real) (capacity Real)) Real)

(constraint (=> (and (>= capacity 0) (>= item1 0)) (and (subspec item1 capacity (fy1 item1 capacity)) (=> (subspec item1 capacity u1) (<= u1 (fy1 item1 capacity))))))

(check-synth)
