(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T)))))
(assert (exists ((y10084 T) (y10085 T) (y10086 T) (y10065 T) (y10079 T) (y10078 T) (y10082 T) (y10069 T) (y10066 T) (y10067 T) (y10064 T) (y10076 T) (y10062 T) (y10063 T) (y10073 T) (y10070 T) (y10087 T) (y10089 T) (y10080 T) (y10072 T) (y10081 T) (y10091 T) (y10068 T) (y10092 T) (y10083 T) (y10071 T) (y10075 T) (y10074 T) (y10088 T) (y10077 T) (y10090 T)) 
  (or 
    (and (= y10062 (f2 y10064)) (= y10064 (f1 y10065 (f2 (f2 PLACEHOLDER)) (f2 PLACEHOLDER) PLACEHOLDER)) (= y10065 (f2 y10066)) (= y10066 (f2 y10067)) (= y10067 (f2 y10062)) (= y10063 (f2 (f1 y10068 (f2 (f2 PLACEHOLDER)) (f2 PLACEHOLDER) PLACEHOLDER))) (= y10068 (f2 (f2 y10069))) (= y10069 (f2 y10063)) (distinct y10062 y10063)) 
    (and (= y10070 (f1 y10072 (f1 y10070 y10070 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER))) (= y10072 (f1 y10073 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y10073 (f2 y10070)) (= y10071 (f1 (f1 (f2 y10071) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 y10071 y10071 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER))) (distinct y10070 y10071)) 
    (and (= y10074 (f2 (f1 y10076 (f1 (f2 PLACEHOLDER) PLACEHOLDER (f1 (f2 PLACEHOLDER) PLACEHOLDER PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER)) (f1 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER) PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y10076 (f1 y10077 (f1 (f2 PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER PLACEHOLDER)) (= y10077 (f1 y10078 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER) PLACEHOLDER)) (= y10078 (f1 y10074 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y10075 (f2 y10079)) (= y10079 (f1 y10080 (f1 (f2 PLACEHOLDER) PLACEHOLDER (f1 (f2 PLACEHOLDER) PLACEHOLDER PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER)) (f1 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER) PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y10080 (f1 y10081 (f1 (f2 PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER PLACEHOLDER)) (= y10081 (f1 y10082 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER) PLACEHOLDER)) (= y10082 (f1 y10075 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct y10074 y10075)) 
    (and (= y10083 (f1 y10085 (f2 (f1 y10083 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 (f2 (f2 PLACEHOLDER))) (f2 PLACEHOLDER))) (= y10085 (f1 y10086 (f2 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER))) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y10086 (f2 y10087)) (= y10087 (f2 y10088)) (= y10088 (f2 y10083)) (= y10084 (f1 y10089 (f2 (f1 y10084 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 (f2 (f2 PLACEHOLDER))) (f2 PLACEHOLDER))) (= y10089 (f1 y10090 (f2 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER))) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y10090 (f2 y10091)) (= y10091 (f2 y10092)) (= y10092 (f2 y10084)) (distinct y10083 y10084)))))
(check-sat)
