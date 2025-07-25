(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  j3
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  w3
  ((x Int)) Int (u3 x 1 j3))
(define-fun
  j2
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  i2
  () Int (+ 1 (+ 2 (* 2 (+ 2 2)))))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) i2 j2))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  h0
  ((x Int)) Int (+ x x))
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  () Int (+ 2 2))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 g1 y))
(define-fun
  fast
  ((x Int)) Int (* (ite (<= x 0) 1 (w2 x)) (w3 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
