(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  j2
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  h2
  ((x Int)) Int (+ 1 x))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 1 j2))
(define-fun
  h1
  () Int (+ 1 2))
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (div
    (mod (div (w2 x) (- (* 2 (* 2 (* 2 (+ 2 (* 2 (+ 2 2)))))) 1))
      (* 2 (+ 2 (* 2 (+ 2 2)))))
    2))
(define-fun
  f1
  ((x Int)) Int (+ (* x x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 h1))
(define-fun
  f0
  ((x Int)) Int (* 2 (+ (* 2 (+ x x)) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int
  (div (div (div (div (mod (v0 x) (+ 2 v1)) 2) 2) 2) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
