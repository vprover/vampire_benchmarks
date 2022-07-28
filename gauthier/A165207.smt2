(set-logic UFNIA)
(declare-fun f (Int) Int)
(declare-fun g (Int) Int)
(declare-fun h1 (Int) Int)
(assert (forall ((x Int)) (= (h1 x) (+ 2 (* 2 (mod (div x 2) 2))))))
(declare-fun f1 (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (- 2 x))))
(declare-fun f2 (Int) Int)
(assert (forall ((x Int)) (= (f2 x) (div x 2))))
(assert (forall ((n Int)) (= (f n) (ite (<= n 0) 0 (f1 (f (- n 1)))))))
(assert (forall ((x Int)) (= (g x) (f (f2 x)))))
(declare-fun h2 (Int) Int)
(assert (forall ((x Int)) (= (h2 x) (+ 2 (g x)))))
(assert (exists ((c Int)) (and (> c 0) (not (= (h1 c) (h2 c))))))
(check-sat)
