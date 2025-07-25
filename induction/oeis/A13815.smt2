(define-fun-rec
  v5
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v5 (- x 1) y z)))
(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun-rec
  u5
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u5 (- x 1) y z) (v5 (- x 1) y z))))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun
  j5
  () Int (+ (* (+ (* (+ 2 2) 2) 2) 2) 1))
(define-fun
  w5
  ((x Int)) Int (u5 x 1 j5))
(define-fun
  j3
  () Int (+ 1 (* 2 (+ 2 (* 2 (+ 2 2))))))
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int (+ 1 (+ 2 x)))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) 1 j3))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  f4
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 1 (w5 x)))
(define-fun
  fast
  ((x Int)) Int (* (w3 x) (v4 x)))
(define-fun
  f2
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 2 x))
(define-fun
  f1
  ((x Int)) Int (* 2 (+ 2 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  f0
  ((x Int)) Int (+ (* v1 x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (v2 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
