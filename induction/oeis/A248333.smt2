(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u4 (- x 1) y) x)))
(define-fun
  j3
  ((x Int)) Int (div (- x 1) 2))
(define-fun
  i3
  () Int (+ 2 2))
(define-fun
  h4
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  () Int (+ 1 2))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int) (y Int)) Int (div (u4 x y) x))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun
  w3
  ((x Int)) Int (u3 h3 i3 (j3 x)))
(define-fun
  f2
  ((x Int)) Int (+ (* (w3 x) (- 0 1)) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 2 x))
(define-fun
  f1
  ((x Int) (y Int)) Int (div (* y y) (+ (- y x) y)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 0))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v2 c)))))
