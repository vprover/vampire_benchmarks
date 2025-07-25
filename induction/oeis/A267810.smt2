(define-fun
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 (- x y) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y) x)))
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int (+ 1 x))
(define-fun
  v3
  ((x Int)) Int (u3 x (h3 x)))
(define-fun
  h2
  ((x Int)) Int (div x 2))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int) (y Int)) Int y)
(define-fun
  f2
  ((x Int)) Int (ite (<= (mod (- (v3 x) 1) (+ 1 x)) 0) 1 0))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  f1
  ((x Int)) Int (+ (v2 x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  fast
  ((x Int)) Int
  (mod (- (- (- (v1 x) (ite (<= (- x 1) 0) 1 2)) x) 1) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (ite (<= x 0) 0 (+ 1 y)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x x))
(define-fun
  small
  ((x Int)) Int (- (ite (<= (- (v0 x) 1) 0) 1 2) (ite (<= x 0) 0 1)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
