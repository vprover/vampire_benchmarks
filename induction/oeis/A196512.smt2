(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  j2
  () Int (* 2 (+ 2 (* 2 (+ 2 (+ 2 2))))))
(define-fun
  i2
  ((x Int)) Int (ite (<= x 0) 1 (- (* 2 (+ 2 (* 2 (+ 2 2)))) 1)))
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) (i2 x) j2))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  () Int (+ 1 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int)) Int (* (+ 2 (mod 1 x)) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 g1 x))
(define-fun
  f0
  ((x Int)) Int (+ (v1 x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (w2 c)))))
