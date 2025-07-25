(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun
  j0
  ((x Int)) Int (mod x 2))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (div x 2))
(define-fun
  g1
  ((x Int)) Int (- 2 (mod (+ 1 x) (+ 2 2))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  g0
  ((x Int) (y Int)) Int (- y x))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 (j0 x)))
(define-fun
  fast
  ((x Int)) Int (- (mod (+ (v1 x) x) (+ 1 2)) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
