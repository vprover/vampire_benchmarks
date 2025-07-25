(define-fun
  small
  ((x Int)) Int
  (+ (div (+ (mod (* (+ 2 x) x) (+ 2 (+ 2 2))) (div x 2)) 2) x))
(define-fun
  fast
  ((x Int)) Int
  (+ (div (+ (* 2 (mod (* (+ 2 x) x) (+ 2 (+ 2 2)))) x) (+ 2 2)) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
