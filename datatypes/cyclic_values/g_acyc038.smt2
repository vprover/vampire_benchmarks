(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (exists ((y3999 T) (y3998 T) (y3993 T) (y3992 T) (y3991 T) (y3990 T) (y3997 T) (y3996 T) (y3995 T) (y3994 T) (y4000 T) (y4001 T) (y4002 T) (y4003 T) (y4004 T) (y3984 T) (y3985 T) (y3986 T) (y3987 T) (y3988 T) (y3989 T)) 
  (or 
    (and (= y3984 (f1 (f1 y3985))) (= y3985 (f1 y3986)) (= y3986 (f1 y3984))) 
    (and (= y3987 (f1 y3988)) (= y3988 (f1 y3987))) 
    (and (= y3989 (f1 y3990)) (= y3990 (f1 y3989))) (= y3991 (f1 y3991)) 
    (and (= y3992 (f1 y3993)) (= y3993 (f1 y3992))) 
    (and (= y3994 (f1 y3995)) (= y3995 (f1 y3996)) (= y3996 (f1 y3997)) (= y3997 (f1 y3998)) (= y3998 (f1 y3994))) (= y3999 (f1 y3999)) 
    (and (= y4000 (f1 y4001)) (= y4001 (f1 y4002)) (= y4002 (f1 y4003)) (= y4003 (f1 y4000))) (= y4004 (f1 (f1 (f1 (f1 y4004))))))))
(check-sat)
