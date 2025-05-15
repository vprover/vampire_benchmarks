(set-logic UFDT)

(declare-datatype nat ((zero) (s (s0 nat))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))

(define-fun-rec leq ((x nat) (y nat)) Bool
  (match y ((zero (match x ((zero true) ((s x0) false))))
            ((s y0) (or (leq x y0) (= x ( s y0)))))))

; SPECIFICATION
(assert-synth ((x1 nat) (x2 nat)) ((y nat))(=> (leq x2 x1) (= (add y x2) x1)))



