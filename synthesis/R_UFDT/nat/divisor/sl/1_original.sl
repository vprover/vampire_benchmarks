(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((zero) (s (s0 nat))))

(declare-var x nat)

(define-fun-rec add ((x nat) (y nat)) nat (match y ((zero x) ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat (match y ((zero zero) ((s y0) (add (mult x y0) x)))))

(define-fun less ((x nat) (y nat)) Bool (exists ((k nat)) (= (add x (s k)) y)))

(define-fun-rec two_divides ((x nat)) Bool (match x ((zero true) ((s x0) (not (two_divides x0))))))


(synth-fun fy ((x nat)) nat)

(constraint (=> (two_divides x) (= x (mult (fy x) (s (s zero))))))

(check-synth)
