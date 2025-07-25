(define-fun
  small
  ((x Int)) Int
  (+
    (mod (+ (div (div x 2) (+ 1 (+ 2 2))) (mod x (+ 2 (* 2 (+ 2 2)))))
      (ite (<= x 0) 1 x))
    x))
(define-fun
  fast
  ((x Int)) Int
  (+
    (mod
      (+ (* (- 0 (div x (+ 2 (* 2 (+ 2 2))))) (+ (* 2 (+ 2 2)) 1)) x)
      (ite (<= x 0) 1 x))
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
