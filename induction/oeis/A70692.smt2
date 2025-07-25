(define-fun
  small
  ((x Int)) Int
  (mod (ite (<= (mod x (+ 1 2)) 0) 0 x) (+ 1 (* 2 (+ 2 2)))))
(define-fun
  fast
  ((x Int)) Int
  (mod (* (- 2 (* x x)) (* (* x x) x)) (+ 1 (* 2 (+ 2 2)))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
