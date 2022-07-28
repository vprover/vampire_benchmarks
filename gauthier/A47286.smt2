(set-logic UFNIA)
(declare-fun f (Int) Int)
(declare-fun g (Int) Int)
(declare-fun h1 (Int) Int)
(assert (forall ((x Int)) (= (h1 x) (+ (div (+ (+ (div x 2) (mod (- 2 x) (+ 2 2))) x) 2) x))))
(declare-fun f1 (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ (mod x (+ 1 (+ 2 2))) x))))
(declare-fun f2 (Int) Int)
(assert (forall ((x Int)) (= (f2 x) x)))
(assert (forall ((n Int)) (= (f n) (ite (<= n 0) 1 (f1 (f (- n 1)))))))
(assert (forall ((x Int)) (= (g x) (f (f2 x)))))
(declare-fun h2 (Int) Int)
(assert (forall ((x Int)) (= (h2 x) (div (+ 1 (+ (g x) x)) 2))))
(assert (exists ((c Int)) (and (> c 0) (not (= (h1 c) (h2 c))))))
(check-sat)
