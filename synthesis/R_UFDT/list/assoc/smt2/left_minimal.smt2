(set-logic UFDT)

(declare-sort s 0)
(declare-datatype lst ((nil) (cons (cons0 s) (cons1 lst))))

(define-fun-rec app ((x lst) (y lst)) lst
  (match x ((nil y)
            ((cons x0 x1) (cons x0 (app x1 y))))))


; SPECIFICATION
(assert-synth ((x0 lst) (x1 lst) (x2 lst)) ((y lst)) (= (app y x2) (app x0 (app x1 x2))))


