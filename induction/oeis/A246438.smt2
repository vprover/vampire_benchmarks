(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int (- x 1))
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int (- x 1))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f6
  ((x Int) (y Int)) Int (mod (+ 2 x) y))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))
(define-fun
  v6
  ((x Int)) Int (u6 (g6 x) x))
(define-fun
  f5
  ((x Int)) Int (div (+ (v6 x) 1) 2))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 x x))
(define-fun
  f4
  ((x Int)) Int (mod (v5 x) 2))
(define-fun-rec
  t4
  ((x Int)) Int (ite (<= (f4 x) 0) x (t4 (+ x 1))))
(define-fun-rec
  u4
  ((x Int)) Int (ite (<= x 0) (t4 0) (t4 (+ (u4 (- x 1)) 1))))
(define-fun
  fast
  ((x Int)) Int (div (u4 x) 1))
(define-fun
  f3
  ((x Int) (y Int)) Int (mod (+ 2 x) y))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) x))
(define-fun
  f2
  ((x Int)) Int (div (+ (v3 x) 1) 2))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x x))
(define-fun-rec
  t1
  ((x Int)) Int (ite (<= (v2 x) 0) x (t1 (+ x 1))))
(define-fun-rec
  u1
  ((x Int)) Int (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
