(define-fun
  small
  ((x Int)) Int
  (+ 2 (+ (- x (mod (mod (+ x x) (+ 1 (* 2 (+ 2 2)))) 2)) x)))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (ite (<= (- (- (mod x (+ 1 (* 2 (+ 2 2)))) 2) 2) 0) 2 1) x)
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
