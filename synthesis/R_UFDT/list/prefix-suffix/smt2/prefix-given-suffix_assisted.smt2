(set-logic UFDT)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(define-fun-rec app ((x lst) (y lst)) lst
  (match x ((nil y)
            ((cons x0 x1) (cons x0 (app x1 y))))))

(define-fun-rec len ((x lst)) nat
  (match x ((nil zero)
            ((cons x0 x1) (s (len x1))))))

(define-fun-rec inlst ((x nat) (y lst)) Bool
  (match y ((nil false)
            ((cons y0 y1) (or (= x y0) (inlst x y1))))))

(define-fun-rec suff ((x lst) (y lst)) Bool
  (match x ((nil true)
            ((cons x0 x1) (match y ((nil false)
                                    ((cons y0 y1) (or (= (cons x0 x1) (cons y0 y1)) (suff x y1)))))))))


;; LEMMAS
(assert-claim (forall ((x lst)) (or (= x nil) (exists ((y0 nat) (y1 lst)) (= x (cons y0 y1))))))

;SPECIFICATION
(assert-synth ((x1 lst) (x2 lst)) ((y lst)) (=> (suff x2 x1) (= x1 (app y x2))))



