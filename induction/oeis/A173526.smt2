(define-fun
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h5
  () Int (+ 2 (+ 2 2)))
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  () Int (+ 2 (+ 2 2)))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int (mod x (+ 2 (+ 2 2))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) h5))
(define-fun
  g4
  ((x Int)) Int (div x (+ 2 (+ 2 2))))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (mod x (+ 2 (+ 2 2))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) h2))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (div x (v5 x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) x))
(define-fun
  f3
  ((x Int)) Int (- (v4 x) 1))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 x x))
(define-fun
  fast
  ((x Int)) Int (+ (+ (v3 x) 1) x))
(define-fun
  f1
  ((x Int)) Int (div x (v2 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x x))
(define-fun
  f0
  ((x Int)) Int (- (v1 x) 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x x))
(define-fun
  small
  ((x Int)) Int (+ (+ (v0 x) 1) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
