(define-fun
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  h4
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  h2
  () Int (+ 2 (+ 2 2)))
(define-fun
  h1
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  () Int (u4 2 h4))
(define-fun
  f3
  ((x Int)) Int (mod v4 (+ 1 x)))
(define-fun-rec
  t3
  ((x Int)) Int (ite (<= (f3 x) 0) x (t3 (+ x 1))))
(define-fun-rec
  u3
  ((x Int)) Int (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 y))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (* (v3 x y) x) x))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 h2 1 x))
(define-fun
  f1
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 h1))
(define-fun
  f0
  ((x Int)) Int (mod (* v1 x) (+ 1 x)))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  small
  ((x Int)) Int (+ (u0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (w2 c)))))
