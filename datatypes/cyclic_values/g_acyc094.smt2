(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T)))))
(assert (exists ((y10084 T) (y10085 T) (y10086 T) (y10087 T) (y10080 T) (y10078 T) (y10082 T) (y10083 T) (y10075 T) (y10074 T) (y10077 T) (y10076 T) (y10088 T) (y10089 T) (y10073 T) (y10072 T) (y10090 T) (y10079 T) (y10081 T) (y10091 T) (y10093 T) (y10095 T) (y10092 T) (y10094 T)) 
  (or (= y10072 (f3 y10072 PLACEHOLDER)) 
    (and (= y10073 (f3 y10074 (f3 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)))) (= y10074 (f3 y10075 (f2 PLACEHOLDER PLACEHOLDER))) (= y10075 (f2 y10073 PLACEHOLDER))) (= y10076 (f1 y10076 PLACEHOLDER)) 
    (and (= y10077 (f2 y10078 PLACEHOLDER)) (= y10078 (f3 y10079 (f1 (f3 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y10079 (f1 y10080 (f3 PLACEHOLDER PLACEHOLDER))) (= y10080 (f3 y10077 PLACEHOLDER))) 
    (and (= y10081 (f2 y10082 PLACEHOLDER)) (= y10082 (f1 y10083 (f1 PLACEHOLDER PLACEHOLDER))) (= y10083 (f1 y10084 (f1 PLACEHOLDER PLACEHOLDER))) (= y10084 (f2 y10081 PLACEHOLDER))) 
    (and (= y10085 (f3 y10086 (f2 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER)))) (= y10086 (f1 y10087 (f1 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER)))) (= y10087 (f3 y10088 (f1 (f3 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER)))) (= y10088 (f3 y10089 (f3 PLACEHOLDER PLACEHOLDER))) (= y10089 (f3 y10085 PLACEHOLDER))) 
    (and (= y10090 (f3 y10091 PLACEHOLDER)) (= y10091 (f2 y10092 PLACEHOLDER)) (= y10092 (f2 y10090 PLACEHOLDER))) (= y10093 (f1 (f3 y10093 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER))) 
    (and (= y10094 (f3 y10095 PLACEHOLDER)) (= y10095 (f2 y10094 PLACEHOLDER))))))
(check-sat)
