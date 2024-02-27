(set-logic ALL)

; TYPE OF NATURAL NUMBERS
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))

; ADD FUNCTION DEFINITION
(define-fun-rec add ((x0 nat) (x1 nat)) nat
  (ite (= x1 zero)
    x0
    (s (add x0 (s0 x0)))
  )
)

; LEMMAS
(assume (forall ((x0 nat)) (= x0 (add zero x0))))
(assume (forall ((x0 nat) (y0 nat)) (= (add (s x0) y0) (add x0 (s y0)))))

; SPECIFICATION
(synth-fun f ((x nat) (y nat) (z nat)) nat)
(declare-var x nat)
(declare-var y nat)
(declare-var z nat)

(constraint (= (add (add x y) z) (add x (f x y z))))

(check-synth)
