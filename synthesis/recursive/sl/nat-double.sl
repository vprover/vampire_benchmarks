(set-logic ALL)

; TYPE OF NATURAL NUMBERS
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))

; HALF FUNCTION DEFINITION
(define-fun-rec half ((x0 nat)) nat
  (ite (= x0 zero)
    zero
    (ite (= x0 (s zero))
      zero
      (s (half (s0 (s0 x0))))
    ) 
  )
)

; SPECIFICATION
(synth-fun double ((x nat)) nat)
(declare-var x nat)

(constraint (= (half (double x)) x))

(check-synth)
