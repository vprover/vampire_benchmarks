(set-logic HO_UFDT)
(set-feature :recursion true)

(declare-datatype nat ((zero) (s (s0 nat))))

(declare-var x nat)
(declare-var fib (-> nat nat))

(define-fun-rec add ((x nat) (y nat)) nat (match y ((zero x) ((s y0) (s (add x y0))))))

(assume (forall ((x nat)) (= (fib x) (match x ((zero (s zero)) ((s x0) (match x0 ((zero (s zero)) ((s x1) (add (fib x1) (fib (s x1))))))))))))

(synth-fun fy ((x nat)) nat)

(constraint (= (fib (fib x)) (fy x)))

(check-synth)
