(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun
  i0
  ((x Int)) Int (ite (<= x 0) (- 0 1) 2))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (- x 2))
(define-fun
  g1
  ((x Int)) Int (- x 2))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  g0
  ((x Int) (y Int)) Int (+ 2 y))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) (i0 x) 1))
(define-fun
  fast
  ((x Int)) Int
  (- (+ (* x x) (v1 x)) (ite (<= x 0) 1 (* 2 (+ (- x 2) x)))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
