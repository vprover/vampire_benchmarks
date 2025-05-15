  (set-logic UFDT)

(declare-datatype nat ((zero) (s (s0 nat))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat
  (match y ((zero zero)
           ((s y0) (add (mult x y0) x)))))

; SPECIFICATION
(assert-synth ((x0 nat) (x1 nat) (x2 nat)  (x3 nat))
		((y nat))
			(=
				(add (add (mult x0 x1) (mult x0 x2)) (mult x0 x3))
				     (mult x0 y)
			)
		)
