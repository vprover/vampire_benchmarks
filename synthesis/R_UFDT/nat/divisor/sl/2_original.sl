(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((zero) (s (s0 nat))))

(declare-var x0 nat)
(declare-var x1 nat)

(define-fun-rec add ((x nat) (y nat)) nat (match y ((zero x) ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat (match y ((zero zero) ((s y0) (add (mult x y0) x)))))

(define-fun less ((x nat) (y nat)) Bool (exists ((k nat)) (= (add x (s k)) y)))

(define-fun-rec divides ((x nat) (y nat)) Bool (or (= y zero) (and (distinct x zero) (exists ((z nat)) (and (= y (add z x)) (divides x z))))))


(synth-fun fy ((x0 nat) (x1 nat)) nat)

(constraint (=> (and (and (divides x0 x1) (distinct x0 zero)) (distinct x1 zero)) (= x1 (mult (fy x0 x1) x0))))

(check-synth)
