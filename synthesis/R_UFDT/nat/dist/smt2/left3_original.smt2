  (set-logic UFDT)

(declare-datatype nat ((zero) (s (s0 nat))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))


(define-fun-rec mult ((x nat) (y nat)) nat
  (match y ((zero zero)
           ((s y0) (add (mult x y0) x)))))

; SPECIFICATION
(assert-synth
  ((x0 nat) (x1 nat) (x2 nat) (x3 nat) (x4 nat))
	((y nat))
    (=
      (add (add (add (mult x1 x0) (mult x2 x0)) (mult x3 x0)) (mult x4 x0))
            (mult y x0)
    ))
