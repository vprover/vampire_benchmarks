(define-fun
  j4
  ((x Int)) Int x)
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  i4
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int) (y Int)) Int (div (div y 2) 2))
(define-funs-rec
  ((v4
    ((x Int) (y Int) (z Int)) Int)
   (u4
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g4 (u4 (- x 1) y z) (v4 (- x 1) y z)))
   (ite (<= x 0) y (+ (u4 (- x 1) y z) (v4 (- x 1) y z)))))
(define-fun
  w4
  ((x Int)) Int (u4 x x x))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (div y (- 2 (mod x 2))))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (+ (+ (mod (+ (w4 x) x) 2) (mod x 2)) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 2 x))
(define-fun
  f2
  ((x Int)) Int (mod (+ (+ (mod (+ (v3 x) 1) 2) 1) x) 2))
(define-fun-rec
  t2
  ((x Int)) Int (ite (<= (f2 x) 0) x (t2 (+ x 1))))
(define-fun-rec
  u2
  ((x Int)) Int (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))
(define-fun
  fast
  ((x Int)) Int (* (+ (* (u2 x) 2) 2) 2))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (mod y 2) x))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 x))
(define-fun
  f0
  ((x Int)) Int (+ (+ (mod (div (div (w1 x) 2) 2) 2) 1) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (* (* (v0 x) 2) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
