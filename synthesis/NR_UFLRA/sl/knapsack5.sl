;; Based on [Bjørner, Hozzová 2025]
(set-logic UFLRA)
(set-feature :recursion true)


(declare-var u1 Real)
(declare-var u2 Real)
(declare-var u3 Real)
(declare-var u4 Real)
(declare-var u5 Real)
(declare-var item1 Real)
(declare-var item2 Real)
(declare-var item3 Real)
(declare-var item4 Real)
(declare-var item5 Real)
(declare-var capacity Real)

(define-fun subspec ((i1 Real) (i2 Real) (i3 Real) (i4 Real) (i5 Real) (c Real) (x1 Real) (x2 Real) (x3 Real) (x4 Real) (x5 Real)) Bool (and (or (= x1 i1) (= x1 0)) (or (= x2 i2) (= x2 0)) (or (= x3 i3) (= x3 0)) (or (= x4 i4) (= x4 0)) (or (= x5 i5) (= x5 0)) (<= (+ x1 x2 x3 x4 x5) c)))


(synth-fun fy1 ((item1 Real) (item2 Real) (item3 Real) (item4 Real) (item5 Real) (capacity Real)) Real)
(synth-fun fy2 ((item1 Real) (item2 Real) (item3 Real) (item4 Real) (item5 Real) (capacity Real)) Real)
(synth-fun fy3 ((item1 Real) (item2 Real) (item3 Real) (item4 Real) (item5 Real) (capacity Real)) Real)
(synth-fun fy4 ((item1 Real) (item2 Real) (item3 Real) (item4 Real) (item5 Real) (capacity Real)) Real)
(synth-fun fy5 ((item1 Real) (item2 Real) (item3 Real) (item4 Real) (item5 Real) (capacity Real)) Real)

(constraint (=> (and (>= capacity 0) (>= item1 0) (>= item2 0) (>= item3 0) (>= item4 0) (>= item5 0)) (and (subspec item1 item2 item3 item4 item5 capacity (fy1 item1 item2 item3 item4 item5 capacity) (fy2 item1 item2 item3 item4 item5 capacity) (fy3 item1 item2 item3 item4 item5 capacity) (fy4 item1 item2 item3 item4 item5 capacity) (fy5 item1 item2 item3 item4 item5 capacity)) (=> (subspec item1 item2 item3 item4 item5 capacity u1 u2 u3 u4 u5) (<= (+ u1 u2 u3 u4 u5) (+ (fy1 item1 item2 item3 item4 item5 capacity) (fy2 item1 item2 item3 item4 item5 capacity) (fy3 item1 item2 item3 item4 item5 capacity) (fy4 item1 item2 item3 item4 item5 capacity) (fy5 item1 item2 item3 item4 item5 capacity)))))))

(check-synth)
