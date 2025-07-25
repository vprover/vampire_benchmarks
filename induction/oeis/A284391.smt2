(define-fun
  j4
  ((x Int)) Int x)
(define-fun
  h4
  () Int (+ 1 (* 2 (+ 2 2))))
(define-fun
  h3
  ((x Int)) Int (div (+ (+ x x) x) (+ 2 2)))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (- x 1))
(define-fun
  g4
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v4
    ((x Int) (y Int) (z Int)) Int)
   (u4
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g4 (u4 (- x 1) y z) (v4 (- x 1) y z)))
   (ite (<= x 0) y (+ (u4 (- x 1) y z) (v4 (- x 1) y z)))))
(define-fun
  w4
  ((x Int)) Int (u4 h4 0 x))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (mod (w4 x) 2))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (h3 x)))
(define-fun
  f2
  ((x Int)) Int
  (+
    (-
      (mod (+ (mod (mod (+ (mod (+ (v3 x) x) 2) 1) 2) (+ 1 x)) 2)
        (+ 1 2))
      1)
    x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 2 x))
(define-fun
  fast
  ((x Int)) Int (mod (div (- (v2 x) x) 2) 2))
(define-fun
  f1
  ((x Int)) Int (ite (<= (mod (div x 2) 2) 0) 2 (div x 2)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x (h1 x)))
(define-fun
  f0
  ((x Int)) Int (+ (v1 x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (mod (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
