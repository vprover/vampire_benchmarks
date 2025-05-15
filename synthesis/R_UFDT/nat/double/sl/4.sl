(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((zero) (s (s0 nat))))

(declare-var x nat)

(define-fun-rec half ((x nat)) nat (match x ((zero zero) ((s x0) (match x0 ((zero zero) ((s x1) (s (half x1)))))))))

(define-fun-rec even ((x nat)) Bool (match x ((zero true) ((s x0) (match x0 ((zero false) ((s x1) (even x1))))))))


(synth-fun fy ((x nat)) nat)

(constraint (and (= (half (half (fy x))) x) (even (fy x))))

(check-synth)
