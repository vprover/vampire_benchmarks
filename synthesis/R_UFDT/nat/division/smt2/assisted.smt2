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

(define-fun leq ((x nat) (y nat)) Bool
  (exists ((k nat))(= (add x k) y))
)

;LEMMAS
(assert-claim (forall ((x nat)) (= x (add zero x))))
(assert-claim (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert-claim (forall ((x nat)) (= (mult zero x) zero)))
(assert-claim (forall ((x nat) (y nat)) (= (mult (s x) y) (add (mult x y) y))))
(assert-claim (forall ((x nat)) (or (= x zero) (exists ((y nat)) (= x (s y))))))


; SPECIFICATION
(assert-synth ((x1 nat) (x2 nat)) ((y nat)) (=> (distinct x2 zero) (and (leq (mult y x2) x1) (less x1 (mult (s y) x2)))))



