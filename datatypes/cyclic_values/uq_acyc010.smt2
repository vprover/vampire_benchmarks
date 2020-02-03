(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T))
  (f4 (proj0f4 T)))))
(assert (exists ((y1128 T) (y1125 T) (y1135 T) (y1127 T) (y1133 T) (y1132 T) (y1130 T)) (forall ((x1140 T) (x1148 T) (x1143 T) (x1141 T) (x1139 T) (x1147 T) (x1145 T) (x1144 T)) 
  (or 
    (and (= y1125 (f3 (f4 (f4 x1141)) PLACEHOLDER (f2 (f4 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= x1141 (f1 y1125))) (= y1127 (f3 y1127 PLACEHOLDER PLACEHOLDER)) (= y1128 x1144) 
    (and (= x1143 (f4 (f2 (f1 x1143) y1130 PLACEHOLDER))) (= y1130 (f3 x1143 PLACEHOLDER PLACEHOLDER))) (= x1147 (f4 x1147)) (= y1132 (f4 y1132)) 
    (and (= y1133 (f3 x1139 (f4 PLACEHOLDER) PLACEHOLDER)) (= x1139 (f3 y1133 PLACEHOLDER PLACEHOLDER))) 
    (and (= y1135 (f1 x1145)) (= x1145 (f1 y1135))) 
    (and (= x1148 (f1 x1140)) (= x1140 (f1 x1148)))))))
(check-sat)