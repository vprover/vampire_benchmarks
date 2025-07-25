(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u0 (- x 1) y) x)))
(define-fun
  h0
  ((x Int)) Int (* (+ 1 2) (* (- (* x x) x) (+ 1 2))))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+ (* (+ 1 2) (* (+ 1 2) (- (* x x) x))) (div (+ (* x x) x) 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
