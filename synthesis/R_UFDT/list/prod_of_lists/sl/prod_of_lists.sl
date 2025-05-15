(set-logic HO_UFDT)
(set-feature :recursion true)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(declare-var x0 lst)
(declare-var x1 lst)
(declare-var sum (-> lst nat))
(declare-var prod (-> lst lst lst))

(define-fun-rec add ((x nat) (y nat)) nat (match y ((zero x) ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat (match y ((zero zero) ((s y0) (add (mult x y0) x)))))

(assume (forall ((x lst)) (= (sum x) (match x ((nil zero) ((cons x0 x1) (add (sum x1) x0)))))))
(assume (forall ((x lst) (y lst)) (= (prod x y) (match x ((nil nil) ((cons x0 x1) (match y ((nil nil) ((cons y0 y1) (cons (mult x0 y0) (prod x1 y1)))))))))))

(synth-fun fy ((x0 lst) (x1 lst)) nat)

(constraint (= (fy x0 x1) (sum (prod x0 x1))))

(check-synth)
