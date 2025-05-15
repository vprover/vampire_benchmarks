(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(declare-var l lst)

(define-fun-rec add ((x nat) (y nat)) nat (match y ((zero x) ((s y0) (s (add x y0))))))

(define-fun leq ((x nat) (y nat)) Bool (exists ((k nat)) (= (add x k) y)))

(define-fun-rec occ ((x nat) (y lst)) nat (match y ((nil zero) ((cons y0 y1) (ite (= x y0) (s (occ x y1)) (occ x y1))))))

(define-fun-rec sort1 ((x lst)) lst (match x ((nil nil) ((cons x0 x1) (match x1 ((nil (cons x0 x1)) ((cons x2 x3) (ite (leq x0 x2) (cons x0 (sort1 x1)) (cons x2 (sort1 (cons x0 x3)))))))))))

(define-fun-rec sorted ((x lst)) Bool (match x ((nil true) ((cons x0 x1) (match x1 ((nil true) ((cons x2 x3) (and (leq x0 x2) (sorted (cons x2 x3))))))))))

(define-fun-rec apply_sort1 ((x nat) (y lst)) lst (match x ((zero y) ((s x0) (apply_sort1 x0 (sort1 y))))))


(synth-fun fn ((l lst)) nat)

(constraint (sorted (apply_sort1 (fn l) l)))

(check-synth)
