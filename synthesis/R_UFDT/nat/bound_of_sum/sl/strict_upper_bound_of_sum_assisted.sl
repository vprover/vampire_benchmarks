(set-logic HO_UFDT)
(set-feature :recursion true)

(declare-datatype nat ((zero) (s (s0 nat))))

(declare-var x1 nat)
(declare-var x2 nat)
(declare-var add (-> nat nat nat))

(define-fun-rec mult ((x nat) (y nat)) nat (match y ((zero zero) ((s y0) (add (mult x y0) x)))))

(define-fun less ((x nat) (y nat)) Bool (exists ((k nat)) (= (add x (s k)) y)))

(assume (forall ((x nat) (y nat)) (or (or (less x y) (less y x)) (= x y))))
(assume (forall ((x nat)) (= x (add zero x))))
(assume (forall ((x nat) (y nat)) (= (add x y) (match y ((zero x) ((s y0) (s (add x y0))))))))

(synth-fun fy ((x1 nat) (x2 nat)) nat)

(constraint (less (add x1 x2) (fy x1 x2)))

(check-synth)
