(set-logic HO_UFDT)
(set-feature :recursion true)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(declare-var x1 lst)
(declare-var x2 lst)
(declare-var app (-> lst lst lst))
(declare-var rev (-> lst lst))

(assume (forall ((x lst) (y lst)) (= (app x y) (match x ((nil y) ((cons x0 x1) (cons x0 (app x1 y))))))))
(assume (forall ((x lst)) (= (rev x) (match x ((nil nil) ((cons x0 x1) (app (rev x1) (cons x0 nil))))))))

(synth-fun fy ((x1 lst) (x2 lst)) lst)

(constraint (= (app (rev x1) x2) (fy x1 x2)))

(check-synth)
