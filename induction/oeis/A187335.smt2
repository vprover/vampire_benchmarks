(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  small
  ((x Int)) Int
  (+
    (+ (ite (<= (+ 2 (- 2 (mod (div x 2) (+ 1 (+ 2 2))))) 0) 1 2)
      (div x 2))
    x))
(define-fun
  g0
  ((x Int)) Int (- 2 (mod (+ 2 x) (+ (* 2 (+ 2 2)) 2))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  fast
  ((x Int)) Int (div (- (* (+ (+ (v0 x) x) x) 2) x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
