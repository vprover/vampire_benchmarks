(set-logic UFDT)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(define-fun-rec app ((x lst) (y lst)) lst
  (match x ((nil y)
            ((cons x0 x1) (cons x0 (app x1 y))))))


(define-fun-rec len ((x lst)) nat
  (match x ((nil zero)
            ((cons x0 x1) (s (len x1))))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))

(define-fun leq ((x nat) (y nat)) Bool
  (exists ((k nat))(= (add x k) y))
)


;SPECIFICATION
; k-th element of a list returns first element for k=0,..., last element for k=len(l)-1
(assert-synth ((x0 nat) (x1 lst)) ((y nat)) (=> (leq (s x0) (len x1)) (exists ((z1 lst) (z2 lst)) (and (= x1 (app (app z1 (cons y nil)) z2)) (= (len z1) x0)))))



