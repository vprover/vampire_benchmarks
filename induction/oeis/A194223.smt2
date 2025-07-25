(define-fun
  small
  ((x Int)) Int
  (div
    (+ (+ (div (+ 2 x) (+ 1 2)) (mod (div x (+ 1 2)) 2)) (div x 2))
    2))
(define-fun
  fast
  ((x Int)) Int
  (div
    (+
      (- (ite (<= (mod (+ 2 x) (+ 2 (+ 2 2))) 0) 1 0)
        (div x (+ 2 (+ 2 2))))
      x)
    2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
