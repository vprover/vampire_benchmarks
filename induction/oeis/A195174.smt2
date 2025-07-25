(define-fun
  small
  ((x Int)) Int
  (+ (div (+ (div (div x 2) (+ 1 2)) x) (* 2 (+ 2 2)))
    (ite (<= x 0) 0 1)))
(define-fun
  fast
  ((x Int)) Int
  (+ (div (+ (div x (+ 2 (+ 2 2))) x) (* 2 (+ 2 2)))
    (ite (<= x 0) 0 1)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
