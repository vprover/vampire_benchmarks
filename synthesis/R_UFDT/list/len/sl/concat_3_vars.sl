(set-logic HO_UFDT)
(set-feature :recursion true)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(declare-var x0 lst)
(declare-var x1 lst)
(declare-var x2 lst)
(declare-var app (-> lst lst lst))

(define-fun-rec len ((x lst)) nat (match x ((nil zero) ((cons x0 x1) (s (len x1))))))

(assume (forall ((x lst) (y lst)) (= (app x y) (match x ((nil y) ((cons x0 x1) (cons x0 (app x1 y))))))))

(synth-fun fy ((x0 lst) (x1 lst) (x2 lst)) nat)

(constraint (= (fy x0 x1 x2) (len (app (app x0 x1) x2))))

(check-synth)
