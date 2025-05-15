(set-logic UFDT)

(declare-datatype nat ((zero) (s (s0 nat))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat
  (match y ((zero zero)
           ((s y0) (add (mult x y0) x)))))


(define-fun leq ((x nat) (y nat)) Bool
  (exists ((k nat))(= (add x k) y))
)

; SPECIFICATION
(assert-synth ((x1 nat) (x2 nat)) ((y nat)) (leq (add x1 x2) y))

(set-option :uncomputable (add))

