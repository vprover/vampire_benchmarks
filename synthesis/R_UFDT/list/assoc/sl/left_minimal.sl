(set-logic UFDT)
(set-feature :recursion true)

(declare-sort s 0)
(declare-datatype lst ((nil) (cons (cons0 s) (cons1 lst))))

(declare-var x0 lst)
(declare-var x1 lst)
(declare-var x2 lst)

(define-fun-rec app ((x lst) (y lst)) lst (match x ((nil y) ((cons x0 x1) (cons x0 (app x1 y))))))


(synth-fun fy ((x0 lst) (x1 lst) (x2 lst)) lst)

(constraint (= (app (fy x0 x1 x2) x2) (app x0 (app x1 x2))))

(check-synth)
