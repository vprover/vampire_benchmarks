(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((zero) (s (s0 nat))))

(declare-var x0 nat)
(declare-var x1 nat)
(declare-var x2 nat)
(declare-var x3 nat)

(define-fun-rec add ((x nat) (y nat)) nat (match y ((zero x) ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat (match y ((zero zero) ((s y0) (add (mult x y0) x)))))


(synth-fun fy ((x0 nat) (x1 nat) (x2 nat) (x3 nat)) nat)

(constraint (= (add (add (mult x1 x0) (mult x2 x0)) (mult x3 x0)) (mult (fy x0 x1 x2 x3) x0)))

(check-synth)
