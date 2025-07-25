(define-fun
  small
  ((x Int)) Int (+ 1 (mod (- x 1) (* 2 (- 2 (mod x 2))))))
(define-fun
  fast
  ((x Int)) Int (+ 1 (mod (* (+ 1 x) (- (* x x) 1)) (+ 2 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
