;; Based on [Bjørner, Hozzová 2025]
(set-logic UFLRA)
(set-feature :recursion true)


(declare-var u1 Real)
(declare-var u2 Real)
(declare-var item1 Real)
(declare-var item2 Real)
(declare-var capacity Real)

(define-fun subspec ((i1 Real) (i2 Real) (c Real) (x1 Real) (x2 Real)) Bool (and (or (= x1 i1) (= x1 0)) (or (= x2 i2) (= x2 0)) (<= (+ x1 x2) c)))


(synth-fun fy1 ((item1 Real) (item2 Real) (capacity Real)) Real)
(synth-fun fy2 ((item1 Real) (item2 Real) (capacity Real)) Real)

(constraint (=> (and (>= capacity 0) (>= item1 0) (>= item2 0)) (and (subspec item1 item2 capacity (fy1 item1 item2 capacity) (fy2 item1 item2 capacity)) (=> (subspec item1 item2 capacity u1 u2) (<= (+ u1 u2) (+ (fy1 item1 item2 capacity) (fy2 item1 item2 capacity)))))))

(check-synth)
