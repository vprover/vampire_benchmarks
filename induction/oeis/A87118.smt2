(define-fun
  j3
  ((x Int)) Int x)
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  i1
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int (ite (<= x 0) 1 2))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g3
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (+ 1 x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) (h4 x)))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (mod (- y x) 2) x))
(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z)))))
(define-fun
  w3
  ((x Int)) Int (u3 x 1 x))
(define-fun
  f2
  ((x Int)) Int (* (mod (- (div (- (w3 x) 1) 2) 1) (+ 1 x)) (v4 x)))
(define-fun-rec
  t2
  ((x Int)) Int (ite (<= (f2 x) 0) x (t2 (+ x 1))))
(define-fun-rec
  u2
  ((x Int)) Int (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (mod (+ (div y 2) x) 2) x))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 x x x))
(define-fun
  f0
  ((x Int)) Int (mod (w1 x) (+ 1 (+ 2 x))))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  small
  ((x Int)) Int (div (div (u0 x) 2) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (u2 c)))))
