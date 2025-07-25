(define-fun
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (- (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  h3
  ((x Int)) Int (ite (<= (mod x (+ 1 2)) 0) 1 2))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (- x (mod x 2)))
(define-fun
  h0
  ((x Int)) Int (- x 2))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 1))
(define-fun
  g3
  ((x Int)) Int (mod x 2))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) (h3 x)))
(define-fun
  g2
  ((x Int)) Int (mod (+ 1 x) 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int (mod (- (mod (+ (v3 x) x) (+ 1 2)) 1) (+ 1 x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun
  fast
  ((x Int)) Int (+ (mod (- (v2 x) 2) (+ 1 x)) (mod (+ 1 x) 2)))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  small
  ((x Int)) Int (div (+ (+ (w0 x) (v1 x)) x) (+ 1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
