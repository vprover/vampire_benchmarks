(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  h3
  ((x Int)) Int (+ 1 (- 2 (mod x 2))))
(define-fun
  v3
  ((x Int)) Int (u3 x (h3 x)))
(define-fun
  h1
  () Int (+ 1 2))
(define-fun
  v1
  ((x Int)) Int (u1 x h1))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (+ 1 x))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f2
  ((x Int)) Int (mod (div (v3 x) (+ 2 2)) (+ 2 x)))
(define-fun-rec
  t2
  ((x Int)) Int (ite (<= (f2 x) 0) x (t2 (+ x 1))))
(define-fun-rec
  u2
  ((x Int)) Int (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x)))
(define-fun
  fast
  ((x Int)) Int (+ (v2 x) 2))
(define-fun
  f0
  ((x Int)) Int (mod (div (v1 x) (+ 2 2)) (+ 2 x)))
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
  ((x Int)) Int (+ (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
