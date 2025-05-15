(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((zero) (s (s0 nat))))

(declare-var x0 nat)
(declare-var x1 nat)
(declare-var x2 nat)

(define-fun-rec add ((x nat) (y nat)) nat (match y ((zero x) ((s y0) (s (add x y0))))))


(synth-fun fy ((x0 nat) (x1 nat) (x2 nat)) nat)

(constraint (= (add (add x0 x1) x2) (add x0 (fy x0 x1 x2))))

(check-synth)
