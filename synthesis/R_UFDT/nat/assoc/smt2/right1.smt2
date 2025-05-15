(set-logic UFDT)

(declare-datatype nat ((zero) (s (s0 nat))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))


; SPECIFICATION
(assert-synth ((x0 nat) (x1 nat) (x2 nat)) ((y nat)) (= (add (add x0 x1) x2) (add x0 y)))


