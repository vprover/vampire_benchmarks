(set-logic UFDT)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(define-fun-rec app ((x lst) (y lst)) lst
  (match x ((nil y)
            ((cons x0 x1) (cons x0 (app x1 y))))))

(define-fun-rec len ((x lst)) nat
  (match x ((nil zero)
            ((cons x0 x1) (s (len x1))))))


; SPECIFICATION
(assert-synth ((x0 lst) (x1 lst) (x2 lst)) ((y nat)) (= y (len (app (app x0 x1) x2))))

(set-option :uncomputable (app))


