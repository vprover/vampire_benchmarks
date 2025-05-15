(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(declare-var x lst)

(define-fun-rec app ((x lst) (y lst)) lst (match x ((nil y) ((cons x0 x1) (cons x0 (app x1 y))))))

(define-fun-rec qreva ((x lst) (y lst)) lst (match y ((nil x) ((cons y0 y1) (qreva (cons y0 x) y1)))))

(define-fun rev ((x lst)) lst (qreva nil x))


(synth-fun fy ((x lst)) lst)

(constraint (= x (rev (fy x))))

(check-synth)
