(set-logic UFDT)

(declare-sort s 0)
(declare-datatype lst ((nil) (cons (cons0 s) (cons1 lst))))

(define-fun-rec app ((x lst) (y lst)) lst
  (match x ((nil y)
            ((cons x0 x1) (cons x0 (app x1 y))))))


(assert-synth ((x lst)) ((y s)) (=> (distinct x nil) (exists ((z lst)) (= x (app z (cons y nil))))))


