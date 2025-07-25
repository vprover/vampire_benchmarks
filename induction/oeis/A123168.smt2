(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i0
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  fast
  ((x Int)) Int (* (+ (- (ite (<= x 0) 1 x) 1) x) (- 2 (mod x 2))))
(define-fun
  f1
  ((x Int)) Int (- 1 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) y))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x x x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
