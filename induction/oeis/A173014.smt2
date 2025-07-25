(define-fun
  small
  ((x Int)) Int
  (+ (- (* (mod (- (ite (<= x 0) 1 x) 1) (+ 2 2)) 2) (mod x 2)) 1))
(define-fun
  fast
  ((x Int)) Int
  (mod (- (* (- (* 2 (* x x)) x) x) 1)
    (ite (<= x 0) 2 (* 2 (+ 2 2)))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
