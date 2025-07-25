(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (+ (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  i0
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (* x x))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) x 1))
(define-fun
  small
  ((x Int)) Int (+ (w0 x) x))
(define-fun
  fast
  ((x Int)) Int (- (* 2 (+ (* x x) x)) (ite (<= x 0) 0 1)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
