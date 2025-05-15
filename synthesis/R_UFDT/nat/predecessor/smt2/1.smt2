(set-logic UFDT)

(declare-datatype nat ((zero) (s (s0 nat))))


; SPECIFICATION
(assert-synth ((x nat)) ((y nat)) (or (= x zero) (= x (s y))))


