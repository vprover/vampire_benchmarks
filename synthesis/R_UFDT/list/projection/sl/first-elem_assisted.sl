(set-logic UFDT)
(set-feature :recursion true)

(declare-sort s 0)
(declare-datatype lst ((nil) (cons (cons0 s) (cons1 lst))))

(declare-var x lst)

(define-fun-rec app ((x lst) (y lst)) lst (match x ((nil y) ((cons x0 x1) (cons x0 (app x1 y))))))

(assume (forall ((x lst)) (= x (app x nil))))
(assume (forall ((x lst)) (or (= x nil) (exists ((y0 s) (y1 lst)) (= x (cons y0 y1))))))
(assume (forall ((x s) (y lst)) (= (cons x y) (app (cons x nil) y))))

(synth-fun fy ((x lst)) s)

(constraint (=> (distinct x nil) (exists ((z lst)) (= x (app (cons (fy x) nil) z)))))

(check-synth)
