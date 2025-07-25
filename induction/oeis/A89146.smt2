(define-fun
  small
  ((x Int)) Int (ite (<= (mod x 2) 0) (* 2 (+ (mod x (+ 2 2)) 2)) 1))
(define-fun
  fast
  ((x Int)) Int (+ 1 (mod (* (+ 1 x) (+ 1 (+ 2 x))) (* 2 (+ 2 2)))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
