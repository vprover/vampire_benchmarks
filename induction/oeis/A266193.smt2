(define-fun
  small
  ((x Int)) Int
  (div (+ (mod (+ 1 (div (div x 2) (+ 1 2))) (+ 2 2)) (div x 2)) 2))
(define-fun
  fast
  ((x Int)) Int
  (div (+ (* 2 (mod (+ 1 (div x (+ 2 (+ 2 2)))) (+ 2 2))) x)
    (+ 2 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
