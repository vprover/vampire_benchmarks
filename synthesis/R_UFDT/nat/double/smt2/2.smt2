(set-logic UFDT)

(declare-datatype nat ((zero) (s (s0 nat))))

(define-fun-rec half ((x nat)) nat
  (match x ((zero zero)
           ((s x0) (match x0 ((zero zero)
                             ((s x1) (s (half x1)))))))))

; SPECIFICATION
(assert-synth ((x nat)) ((y nat)) (= (half (half y)) x))


