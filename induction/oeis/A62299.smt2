(define-fun
  small
  ((x Int)) Int
  (div (+ (+ (div (- 1 (div (div (div x 2) 2) 2)) (+ 1 2)) 1) x)
    (+ 1 2)))
(define-fun
  fast
  ((x Int)) Int
  (div (+ (- (* 2 (+ 2 x)) (div x (* 2 (+ 2 2)))) x)
    (+ 1 (* 2 (+ 2 2)))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
