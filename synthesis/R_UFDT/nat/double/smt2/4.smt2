(set-logic UFDT)

(declare-datatype nat ((zero) (s (s0 nat))))

(define-fun-rec half ((x nat)) nat
  (match x ((zero zero)
           ((s x0) (match x0 ((zero zero)
                             ((s x1) (s (half x1)))))))))

(define-fun-rec even ((x nat)) Bool
  (match x ((zero true)
            ((s x0) (match x0 ((zero false)
                              ((s x1) (even x1))))))))

; SPECIFICATION
(assert-synth ((x nat)) ((y nat)) (and (= (half (half y)) x) (even y)))


