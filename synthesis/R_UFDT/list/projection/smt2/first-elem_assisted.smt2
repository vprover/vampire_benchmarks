(set-logic UFDT)

(declare-sort s 0)
(declare-datatype lst ((nil) (cons (cons0 s) (cons1 lst))))

(define-fun-rec app ((x lst) (y lst)) lst
  (match x ((nil y)
            ((cons x0 x1) (cons x0 (app x1 y))))))

;; LEMMAS
(assert-claim (forall ((x lst)) (= x (app x nil))))
(assert-claim (forall ((x lst)) (or (= x nil) (exists ((y0 s) (y1 lst)) (= x (cons y0 y1))))))
(assert-claim (forall ((x s) (y lst)) (= (cons x y) (app (cons x nil) y))))

;SPECIFICATION
(assert-synth ((x lst)) ((y s)) (=> (distinct x nil) (exists ((z lst)) (= x (app (cons y nil) z)))))



