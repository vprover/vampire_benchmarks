(define-fun
  small
  ((x Int)) Int (+ (- x (mod (mod x (+ 1 2)) 2)) x))
(define-fun
  fast
  ((x Int)) Int (+ (- x (mod (* (- 2 x) x) (+ 1 2))) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
