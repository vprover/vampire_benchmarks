(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun
  v2
  ((x Int)) Int (u2 x x))
(define-fun
  j3
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  h3
  ((x Int)) Int (- x 1))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int) (y Int)) Int (- (* x y) 1))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) 1 j3))
(define-fun
  fast
  ((x Int)) Int
  (- (* (w3 x) (ite (<= x 0) 1 (- (* 2 (* 2 (+ 2 2))) 1))) 1))
(define-fun
  f1
  ((x Int)) Int (+ (- x 1) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun
  f0
  ((x Int)) Int (* 2 (+ (v1 x) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x (v2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
