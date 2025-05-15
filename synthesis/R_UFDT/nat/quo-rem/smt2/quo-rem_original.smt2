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

; LEMMAS
(assert-claim (forall ((x nat)) (not (less x zero))))
(assert-claim (forall ((x nat) (y nat)) (=> (less x y) (distinct x y))))
(assert-claim (forall ((x nat) (y nat)) (=> (less x y) (or (less (s x) y) (= (s x) y)))))
(assert-claim (forall ((x nat) (y nat)) (=> (not (less x y)) (or (= y x) (less y x)))))


; SPECIFICATION
(assert-synth ((x1 nat) (x2 nat)) ((r nat) (q nat)) (or (= x2 zero) (and (less r x2) (= x1 (add (mult q x2) r)))))


