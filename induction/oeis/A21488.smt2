(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  j3
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  j0
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  h4
  () Int (+ 2 (* 2 (+ 2 (* 2 (+ 2 2))))))
(define-fun
  h3
  ((x Int)) Int (+ 1 x))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) 1 j3))
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 j0))
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f4
  ((x Int)) Int (* x x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  () Int (u4 1 h4))
(define-fun
  fast
  ((x Int)) Int (mod (div (w3 x) v4) (* 1 (+ 2 (* 2 (+ 2 2))))))
(define-fun
  f2
  ((x Int)) Int (* 2 (+ 2 x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 2 2))
(define-fun
  h1
  () Int (+ 2 v2))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 1 h1))
(define-fun
  small
  ((x Int)) Int (mod (div (w0 x) v1) (* 1 (+ 2 (* 2 (+ 2 2))))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
