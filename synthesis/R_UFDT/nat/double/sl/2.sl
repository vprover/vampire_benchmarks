(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((zero) (s (s0 nat))))

(declare-var x nat)

(define-fun-rec half ((x nat)) nat (match x ((zero zero) ((s x0) (match x0 ((zero zero) ((s x1) (s (half x1)))))))))


(synth-fun fy ((x nat)) nat)

(constraint (= (half (half (fy x))) x))

(check-synth)
