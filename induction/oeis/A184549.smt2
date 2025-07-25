(define-fun
  small
  ((x Int)) Int
  (+ (- (* (+ 1 2) (+ (+ (mod (div x 2) 2) x) x)) (mod x 2)) x))
(define-fun
  fast
  ((x Int)) Int
  (- (* 2 (* (+ 1 2) (+ (div (+ 2 x) (+ 2 2)) x))) (div x 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
