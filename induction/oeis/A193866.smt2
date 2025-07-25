(define-fun
  small
  ((x Int)) Int (- (* (+ 1 2) (* (+ (mod x 2) x) x)) (div x 2)))
(define-fun
  fast
  ((x Int)) Int (- (* (+ 1 (* 2 (+ (+ x x) x))) (- x (div x 2))) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
