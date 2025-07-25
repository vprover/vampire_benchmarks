(define-funs-rec
  ((u5
    ((x Int) (y Int) (z Int)) Int)
   (v5
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u5 (- x 1) y z) (v5 (- x 1) y z)))
   (ite (<= x 0) z (u5 (- x 1) y z))))
(define-fun
  w5
  ((x Int)) Int (u5 x 1 1))
(define-funs-rec
  ((u4
    ((x Int) (y Int) (z Int)) Int)
   (v4
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u4 (- x 1) y z) (v4 (- x 1) y z)))
   (ite (<= x 0) z (u4 (- x 1) y z))))
(define-fun
  w4
  ((x Int)) Int (u4 x 1 2))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (v2 (- x 1) y z))
   (ite (<= x 0) z (- (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  j2
  ((x Int)) Int (mod x 2))
(define-fun
  w2
  ((x Int)) Int (u2 x 1 (j2 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (w2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int (- x 1))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (+ x x) y))
(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) z (+ (u3 (- x 1) y z) (v3 (- x 1) y z)))))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) 2 1))
(define-fun
  fast
  ((x Int)) Int
  (mod (- (+ (* (* (w3 x) (ite (<= x 0) 1 2)) (w4 x)) 1) x) (w5 x)))
(define-fun
  f2
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (- (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
