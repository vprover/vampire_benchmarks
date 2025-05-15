(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((zero) (s (s0 nat))))

(declare-var x0 nat)
(declare-var x1 nat)
(declare-var x2 nat)
(declare-var x3 nat)

(define-fun-rec add ((x nat) (y nat)) nat (match y ((zero x) ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat (match y ((zero zero) ((s y0) (add (mult x y0) x)))))

(assume (forall ((x nat) (y nat) (z nat)) (= (add (add x y) z) (add x (add y z)))))

(synth-fun fy ((x0 nat) (x1 nat) (x2 nat) (x3 nat)) nat)

(constraint (= (add (add (mult x0 x1) (mult x0 x2)) (mult x0 x3)) (mult x0 (fy x0 x1 x2 x3))))

(check-synth)
