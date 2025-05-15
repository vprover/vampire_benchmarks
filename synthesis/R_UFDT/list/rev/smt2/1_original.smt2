(set-logic UFDT)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(define-fun-rec app ((x lst) (y lst)) lst
  (match x ((nil y)
            ((cons x0 x1) (cons x0 (app x1 y))))))

(define-fun-rec rev ((x lst)) lst
  (match x ((nil nil)
            ((cons x0 x1) (app (rev x1) (cons x0 nil))))))


; SPECIFICATION
(assert-synth ((x lst)) ((y lst)) (= x (rev y)))


