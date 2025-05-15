(set-logic HO_UFDT)
(set-feature :recursion true)

(declare-datatype nat ((zero) (s (s0 nat))))

(declare-var x nat)
(declare-var fac (-> nat nat))

(define-fun-rec add ((x nat) (y nat)) nat (match y ((zero x) ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat (match y ((zero zero) ((s y0) (add (mult x y0) x)))))

(assume (forall ((x nat)) (= (fac x) (match x ((zero (s zero)) ((s x0) (mult (s x0) (fac x0))))))))

(synth-fun fy ((x nat)) nat)

(constraint (= (fac (fac x)) (fy x)))

(check-synth)
