(define-fun
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h5
  () Int (+ 2 2))
(define-fun
  h4
  () Int (+ 2 2))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) h4))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int (+ x x))
(define-fun
  f5
  ((x Int)) Int (* x x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  () Int (u5 1 h5))
(define-fun
  g3
  () Int (- v5 1))
(define-fun
  f3
  ((x Int)) Int (div x (v4 x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 g3 x))
(define-fun
  f2
  ((x Int)) Int (mod (v3 x) 2))
(define-fun-rec
  t2
  ((x Int)) Int (ite (<= (f2 x) 0) x (t2 (+ x 1))))
(define-fun-rec
  u2
  ((x Int)) Int (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))
(define-fun
  fast
  ((x Int)) Int (- (+ (+ (u2 x) 0) 2) x))
(define-fun
  f1
  ((x Int)) Int (ite (<= (mod x 2) 0) (div x 2) 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  small
  ((x Int)) Int (- (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
