(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (exists ((y1155 T) (y1154 T) (y1157 T) (y1156 T) (y1151 T) (y1150 T) (y1153 T) (y1152 T)) 
    (and (= y1150 (f1 y1152)) (= y1152 (f1 y1153)) (= y1153 (f1 y1154)) (= y1154 (f1 y1150)) (= y1151 (f1 y1155)) (= y1155 (f1 y1156)) (= y1156 (f1 y1157)) (= y1157 (f1 y1151)) (distinct y1150 y1151))))
(check-sat)
