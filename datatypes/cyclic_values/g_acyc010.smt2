(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (exists ((y1111 T) (y1112 T) (y1110 T) (y1116 T) (y1102 T) (y1103 T) (y1113 T) (y1101 T) (y1106 T) (y1107 T) (y1104 T) (y1105 T) (y1115 T) (y1108 T) (y1109 T) (y1114 T)) 
  (or 
    (and (= y1101 (f1 y1102)) (= y1102 (f1 y1101))) 
    (and (= y1103 (f1 y1104)) (= y1104 (f1 y1105)) (= y1105 (f1 y1106)) (= y1106 (f1 y1107)) (= y1107 (f1 y1103))) 
    (and (= y1108 (f1 y1109)) (= y1109 (f1 y1108))) 
    (and (= y1110 (f1 (f1 (f1 y1111)))) (= y1111 (f1 y1110))) 
    (and (= y1112 (f1 (f1 y1113))) (= y1113 (f1 y1112))) 
    (and (= y1114 (f1 (f1 (f1 y1115)))) (= y1115 (f1 y1116)) (= y1116 (f1 y1114))))))
(check-sat)
