  (set-logic UFDT)

(declare-datatype nat ((zero) (s (s0 nat))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat
  (match y ((zero zero)
           ((s y0) (add (mult x y0) x)))))


;LEMMAS
(assert-claim (forall ((x nat) (y nat) (z nat)) (= (add (add x y) z) (add x (add y z)))))
(assert-claim (forall ((x nat)) (= zero (mult zero x))))
(assert-claim (forall ((x nat) (y nat)) (= (mult (s x) y) (add (mult x y) y))))


; SPECIFICATION
(assert-synth ((x0 nat) (x1 nat) (x2 nat))
		((y nat)) 
			(=
				(add (mult x1 x0) (mult x2 x0))
				     (mult y x0)
			)
		)

