(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((zero) (s (s0 nat))))

(declare-var x nat)


(synth-fun fy ((x nat)) nat)

(constraint (or (= x zero) (= x (s (fy x)))))

(check-synth)
