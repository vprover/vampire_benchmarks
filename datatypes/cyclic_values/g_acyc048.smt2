(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T)))))
(assert (exists ((y4963 T) (y4977 T) (y4957 T) (y4961 T) (y4974 T) (y4975 T) (y4976 T) (y4960 T) (y4970 T) (y4971 T) (y4972 T) (y4973 T) (y4969 T) (y4968 T) (y4958 T) (y4959 T) (y4956 T) (y4962 T) (y4954 T) (y4955 T) (y4967 T) (y4966 T) (y4965 T) (y4964 T)) 
  (or (= y4954 (f1 y4954)) 
    (and (= y4955 (f2 y4956)) (= y4956 (f1 y4955))) 
    (and (= y4957 (f2 (f2 y4958))) (= y4958 (f2 y4959)) (= y4959 (f2 y4957))) 
    (and (= y4960 (f2 y4961)) (= y4961 (f2 y4962)) (= y4962 (f2 y4963)) (= y4963 (f1 y4964)) (= y4964 (f1 y4960))) 
    (and (= y4965 (f2 y4966)) (= y4966 (f1 y4967)) (= y4967 (f1 y4968)) (= y4968 (f2 y4965))) 
    (and (= y4969 (f2 y4970)) (= y4970 (f2 y4969))) (= y4971 (f2 y4971)) 
    (and (= y4972 (f2 y4973)) (= y4973 (f1 y4974)) (= y4974 (f2 y4975)) (= y4975 (f2 y4972))) 
    (and (= y4976 (f2 y4977)) (= y4977 (f1 y4976))))))
(check-sat)
