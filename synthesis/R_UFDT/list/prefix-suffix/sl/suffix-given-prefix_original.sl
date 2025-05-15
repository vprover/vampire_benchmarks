(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(declare-var x1 lst)
(declare-var x2 lst)

(define-fun-rec app ((x lst) (y lst)) lst (match x ((nil y) ((cons x0 x1) (cons x0 (app x1 y))))))

(define-fun-rec len ((x lst)) nat (match x ((nil zero) ((cons x0 x1) (s (len x1))))))

(define-fun-rec inlst ((x nat) (y lst)) Bool (match y ((nil false) ((cons y0 y1) (or (= x y0) (inlst x y1))))))

(define-fun-rec pref ((x lst) (y lst)) Bool (match x ((nil true) ((cons x0 x1) (match y ((nil false) ((cons y0 y1) (and (= x0 y0) (pref x1 y1)))))))))


(synth-fun fy ((x1 lst) (x2 lst)) lst)

(constraint (=> (pref x2 x1) (= x1 (app x2 (fy x1 x2)))))

(check-synth)
