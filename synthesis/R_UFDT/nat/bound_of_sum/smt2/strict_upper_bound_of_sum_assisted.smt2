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

;LEMMAS
(assert-claim (forall ((x nat) (y nat)) (or (or (less x y) (less y x)) (= x y))))
(assert-claim (forall ((x nat)) (= x (add zero x))))

; SPECIFICATION
(assert-synth ((x1 nat) (x2 nat)) ((y nat)) (less (add x1 x2) y))

(set-option :uncomputable (add))

