(set-logic HO_UFDT)
(set-feature :recursion true)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(declare-var x lst)
(declare-var rev (-> lst lst))

(define-fun-rec app ((x lst) (y lst)) lst (match x ((nil y) ((cons x0 x1) (cons x0 (app x1 y))))))

(assume (forall ((x lst)) (= (rev x) (match x ((nil nil) ((cons x0 x1) (app (rev x1) (cons x0 nil))))))))

(synth-fun fy ((x lst)) lst)

(constraint (= (fy x) (rev (rev x))))

(check-synth)
