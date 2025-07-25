(define-fun
  j4
  ((x Int)) Int x)
(define-fun
  h4
  () Int (* 2 (+ 2 (+ 2 2))))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g3
  ((x Int)) Int (+ 1 x))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (+ 2 x))
(define-fun
  f4
  ((x Int) (y Int)) Int (+ (* (mod y 2) x) x))
(define-funs-rec
  ((u4
    ((x Int) (y Int) (z Int)) Int)
   (v4
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z)))
   (ite (<= x 0) z (g4 (u4 (- x 1) y z) (v4 (- x 1) y z)))))
(define-fun
  w4
  ((x Int)) Int (u4 h4 1 x))
(define-fun
  f3
  ((x Int)) Int (mod (- (div (- (w4 x) 1) 2) 1) (+ 1 x)))
(define-fun-rec
  t3
  ((x Int)) Int (ite (<= (f3 x) 0) x (t3 (+ x 1))))
(define-fun-rec
  u3
  ((x Int)) Int (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x)))
(define-fun
  fast
  ((x Int)) Int (+ (- (- (v3 x) 1) 2) 2))
(define-fun
  f2
  ((x Int) (y Int)) Int (mod (+ 2 x) y))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun
  f0
  ((x Int)) Int (- (ite (<= (v1 x) 0) 1 x) 1))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x)))
(define-fun
  small
  ((x Int)) Int (- (v0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
