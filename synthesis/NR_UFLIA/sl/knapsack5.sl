;; From [Bjørner, Hozzová 2025]
(set-logic UFLIA)
(set-feature :recursion true)


(declare-var u1 Int)
(declare-var u2 Int)
(declare-var u3 Int)
(declare-var u4 Int)
(declare-var u5 Int)
(declare-var item1 Int)
(declare-var item2 Int)
(declare-var item3 Int)
(declare-var item4 Int)
(declare-var item5 Int)
(declare-var capacity Int)

(define-fun subspec ((i1 Int) (i2 Int) (i3 Int) (i4 Int) (i5 Int) (c Int) (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int)) Bool (and (or (= x1 i1) (= x1 0)) (or (= x2 i2) (= x2 0)) (or (= x3 i3) (= x3 0)) (or (= x4 i4) (= x4 0)) (or (= x5 i5) (= x5 0)) (<= (+ x1 x2 x3 x4 x5) c)))


(synth-fun fy1 ((item1 Int) (item2 Int) (item3 Int) (item4 Int) (item5 Int) (capacity Int)) Int)
(synth-fun fy2 ((item1 Int) (item2 Int) (item3 Int) (item4 Int) (item5 Int) (capacity Int)) Int)
(synth-fun fy3 ((item1 Int) (item2 Int) (item3 Int) (item4 Int) (item5 Int) (capacity Int)) Int)
(synth-fun fy4 ((item1 Int) (item2 Int) (item3 Int) (item4 Int) (item5 Int) (capacity Int)) Int)
(synth-fun fy5 ((item1 Int) (item2 Int) (item3 Int) (item4 Int) (item5 Int) (capacity Int)) Int)

(constraint (=> (and (>= capacity 0) (>= item1 0) (>= item2 0) (>= item3 0) (>= item4 0) (>= item5 0)) (and (subspec item1 item2 item3 item4 item5 capacity (fy1 item1 item2 item3 item4 item5 capacity) (fy2 item1 item2 item3 item4 item5 capacity) (fy3 item1 item2 item3 item4 item5 capacity) (fy4 item1 item2 item3 item4 item5 capacity) (fy5 item1 item2 item3 item4 item5 capacity)) (=> (subspec item1 item2 item3 item4 item5 capacity u1 u2 u3 u4 u5) (<= (+ u1 u2 u3 u4 u5) (+ (fy1 item1 item2 item3 item4 item5 capacity) (fy2 item1 item2 item3 item4 item5 capacity) (fy3 item1 item2 item3 item4 item5 capacity) (fy4 item1 item2 item3 item4 item5 capacity) (fy5 item1 item2 item3 item4 item5 capacity)))))))

(check-synth)
