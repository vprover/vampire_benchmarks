(set-logic UFDT)

(declare-datatype nat ((zero) (s (s0 nat))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat
  (match y ((zero zero)
           ((s y0) (add (mult x y0) x)))))

(define-fun less ((x nat) (y nat)) Bool
 (exists ((k nat))(= (add x (s k)) y))
)


; SPECIFICATION
(assert-synth ((x1 nat) (x2 nat)) ((r nat)) (or (= x2 zero) (and (less r x2) (exists((q nat)) (= x1 (add (mult q x2) r))))))



