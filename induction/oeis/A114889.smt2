(define-fun
  j5
  ((x Int)) Int x)
(define-fun
  h5
  () Int (+ 2 2))
(define-fun
  h4
  ((x Int) (y Int)) Int y)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int) (y Int)) Int (div y (+ 1 2)))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f5
  ((x Int) (y Int)) Int (+ (* x y) x))
(define-funs-rec
  ((u5
    ((x Int) (y Int) (z Int)) Int)
   (v5
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f5 (u5 (- x 1) y z) (v5 (- x 1) y z)))
   (ite (<= x 0) z (g5 (u5 (- x 1) y z) (v5 (- x 1) y z)))))
(define-fun
  w5
  ((x Int)) Int (u5 h5 1 x))
(define-fun
  f4
  ((x Int)) Int (ite (<= (mod (w5 x) (+ 1 2)) 0) 1 0))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 1 y))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (* (v4 x y) x) 1))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
(define-fun
  f2
  ((x Int)) Int (- (- (v3 x) 1) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 2 x))
(define-fun
  fast
  ((x Int)) Int (- (+ (+ (+ (v2 x) 2) x) x) (+ 1 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int (* 2 (* 2 (+ (- x (div x y)) x))))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int)) Int (+ (- (mod (v1 x) (+ 1 2)) 1) x))
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
