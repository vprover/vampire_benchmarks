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

; SPECIFICATION
(assert-synth ((x0 nat) (x1 nat) (x2 nat))
		((y nat)) 
			(=
				(add (mult x0 x1) (mult x0 x2))
				     (mult x0 y)
			)
		)

