(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i0
  () Int (+ 1 2))
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  fast
  ((x Int)) Int (+ (mod (- x 1) (+ 1 (- 2 (mod x (+ 1 2))))) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (- x (mod y x)))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 i0 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
