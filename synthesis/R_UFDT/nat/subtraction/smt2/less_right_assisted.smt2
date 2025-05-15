(set-logic UFDT)

(declare-datatype nat ((zero) (s (s0 nat))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))

(define-fun-rec less ((x nat) (y nat)) Bool
  (match y ((zero false)
            ((s y0) (or (less x y0) (= x y0))))))


;LEMMAS
(assert-claim (forall ((x nat)) (= x (add zero x))))
(assert-claim (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))


; SPECIFICATION
(assert-synth ((x1 nat) (x2 nat)) ((y nat))(=> (less x2 x1) (= (add x2 (s y)) x1)))


