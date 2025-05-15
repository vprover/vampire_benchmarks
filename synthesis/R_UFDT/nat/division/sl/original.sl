(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((zero) (s (s0 nat))))

(declare-var x1 nat)
(declare-var x2 nat)

(define-fun-rec add ((x nat) (y nat)) nat (match y ((zero x) ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat (match y ((zero zero) ((s y0) (add (mult x y0) x)))))

(define-fun less ((x nat) (y nat)) Bool (exists ((k nat)) (= (add x (s k)) y)))

(define-fun leq ((x nat) (y nat)) Bool (exists ((k nat)) (= (add x k) y)))


(synth-fun fy ((x1 nat) (x2 nat)) nat)

(constraint (=> (distinct x2 zero) (and (leq (mult (fy x1 x2) x2) x1) (less x1 (mult (s (fy x1 x2)) x2)))))

(check-synth)
