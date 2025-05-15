(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((zero) (s (s0 nat))))

(declare-var x1 nat)
(declare-var x2 nat)

(define-fun-rec add ((x nat) (y nat)) nat (match y ((zero x) ((s y0) (s (add x y0))))))

(define-fun-rec leq ((x nat) (y nat)) Bool (match y ((zero (match x ((zero true) ((s x0) false)))) ((s y0) (or (leq x y0) (= x (s y0)))))))


(synth-fun fy ((x1 nat) (x2 nat)) nat)

(constraint (=> (leq x2 x1) (= (add x2 (fy x1 x2)) x1)))

(check-synth)
