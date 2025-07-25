(define-fun
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h6
  ((x Int)) Int (+ (div x 2) x))
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  () Int (+ 1 2))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) h3))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f6
  ((x Int)) Int (ite (<= (mod x (+ 1 2)) 0) (div x (+ 1 2)) x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 x (h6 x)))
(define-fun
  f5
  ((x Int)) Int (mod (div (mod (v6 x) (+ 1 2)) 2) (+ 1 x)))
(define-fun-rec
  t5
  ((x Int)) Int (ite (<= (f5 x) 0) x (t5 (+ x 1))))
(define-fun-rec
  u5
  ((x Int)) Int (ite (<= x 0) (t5 0) (t5 (+ (u5 (- x 1)) 1))))
(define-fun
  f4
  ((x Int)) Int (+ (mod (u5 x) 2) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 2 x))
(define-fun
  fast
  ((x Int)) Int (+ (- (v4 x) x) 1))
(define-fun
  f2
  ((x Int)) Int (div x (v3 x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x x))
(define-fun
  f1
  ((x Int)) Int (mod (div (v2 x) 2) 2))
(define-fun-rec
  t1
  ((x Int)) Int (ite (<= (f1 x) 0) x (t1 (+ x 1))))
(define-fun-rec
  u1
  ((x Int)) Int (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))
(define-fun
  f0
  ((x Int)) Int (+ (mod (u1 x) 2) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (+ (- (v0 x) x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
