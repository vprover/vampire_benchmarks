(define-fun
  j5
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int (+ (div x 2) x))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (+ 1 x))
(define-fun
  h0
  ((x Int)) Int (+ x x))
(define-fun
  g5
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v5
    ((x Int) (y Int) (z Int)) Int)
   (u5
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g5 (u5 (- x 1) y z) (v5 (- x 1) y z)))
   (ite (<= x 0) y (+ (u5 (- x 1) y z) (v5 (- x 1) y z)))))
(define-fun
  w5
  ((x Int)) Int (u5 x 0 x))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (mod (w5 x) 2))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 1 (h4 x)))
(define-fun
  f3
  ((x Int)) Int (+ (+ (mod (+ (v4 x) x) 2) 1) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 2 x))
(define-fun
  fast
  ((x Int)) Int
  (+ (mod (+ (div (mod (- (v3 x) x) (+ 1 2)) 2) x) 2) 1))
(define-fun
  f2
  ((x Int)) Int (ite (<= (mod (div x 2) 2) 0) 2 (div x 2)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x (h2 x)))
(define-fun
  f1
  ((x Int)) Int (+ (v2 x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int)) Int (mod (v1 x) 2))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
