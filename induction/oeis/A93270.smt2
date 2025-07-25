(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v1 (- x 1) y z)))
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
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  j3
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  w3
  ((x Int)) Int (u3 x 2 j3))
(define-fun
  j2
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  j1
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 j1))
(define-fun
  i2
  () Int (+ 1 (+ 2 (+ 2 2))))
(define-fun
  w2
  ((x Int)) Int (u2 x i2 j2))
(define-fun
  h3
  ((x Int)) Int x)
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
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (* (* (div (w2 x) (+ 1 (* 2 (+ 2 2)))) (+ 1 (+ 2 2))) (w3 x)))
(define-fun
  f0
  ((x Int)) Int (+ 1 (* 2 (+ (* 2 (* 2 (+ 2 x))) x))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(define-fun
  small
  ((x Int)) Int (* (* (- (v0 x) 2) (w1 x)) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
