(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T)))))
(assert (exists ((y19072 T) (y19053 T) (y19074 T) (y19061 T) (y19063 T) (y19060 T) (y19056 T) (y19049 T) (y19073 T) (y19058 T) (y19059 T) (y19081 T) (y19075 T) (y19069 T) (y19068 T) (y19078 T) (y19050 T) (y19051 T) (y19052 T) (y19066 T) (y19054 T) (y19055 T) (y19070 T) (y19057 T) (y19065 T) (y19064 T) (y19067 T)) (forall ((x19088 T) (x19089 T) (x19091 T) (x19090 T) (x19082 T) (x19083 T) (x19084 T) (x19087 T)) 
  (or (= x19084 (f1 x19084 x19089 x19089)) 
    (and (= y19049 (f1 y19050 (f2 x19089 (f2 x19089 x19089 x19089) x19089) (f2 (f2 x19089 x19089 x19089) (f2 x19089 x19089 (f1 x19089 x19089 x19089)) (f2 x19089 x19089 (f2 x19089 x19089 x19089))))) (= y19050 (f2 y19051 (f2 (f1 (f2 x19089 x19089 x19089) x19089 x19089) x19089 (f2 x19089 (f1 x19089 x19089 x19089) (f2 x19089 x19089 x19089))) (f2 (f2 x19089 x19089 (f2 x19089 x19089 x19089)) (f1 (f1 x19089 x19089 x19089) (f1 x19089 x19089 x19089) x19089) (f1 (f2 x19089 x19089 x19089) (f1 x19089 x19089 x19089) (f1 x19089 x19089 x19089))))) (= y19051 (f2 y19052 x19089 (f2 (f2 x19089 x19089 x19089) x19089 (f2 x19089 x19089 x19089)))) (= y19052 (f1 y19053 x19089 x19089)) (= y19053 (f2 y19049 x19089 x19089))) 
    (and (= y19054 (f2 y19055 (f1 (f2 (f2 x19089 x19089 x19089) x19089 x19089) (f2 (f2 x19089 x19089 x19089) (f1 x19089 x19089 x19089) x19089) (f2 (f1 (f2 x19089 x19089 x19089) x19089 (f1 x19089 x19089 x19089)) (f2 x19089 x19089 x19089) (f1 (f1 x19089 x19089 x19089) (f1 x19089 x19089 x19089) (f2 x19089 x19089 x19089)))) (f1 x19089 x19089 x19089))) (= y19055 (f2 y19056 (f1 y19054 x19089 x19089) (f2 x19089 x19089 x19089))) (= y19056 (f2 y19057 x19089 x19089)) (= y19057 (f1 y19058 x19089 (f2 x19089 x19089 x19089))) (= y19058 (f2 y19054 x19089 x19089))) 
    (and (= y19059 (f2 (f1 y19060 (f2 (f1 x19089 x19089 x19089) (f2 x19089 x19089 x19089) x19089) x19089) (f1 (f1 (f2 x19089 (f2 x19089 x19089 x19089) (f1 x19089 x19089 x19089)) x19089 (f1 x19089 x19089 x19089)) (f2 (f2 x19089 x19089 x19089) (f1 x19089 x19089 x19089) (f2 x19089 (f1 x19089 x19089 x19089) (f1 x19089 x19089 x19089))) (f2 (f2 x19089 x19089 x19089) (f1 x19089 x19089 x19089) x19089)) x19089)) (= y19060 (f1 y19061 (f1 (f2 x19089 x19089 x19089) (f1 x19089 x19089 x19089) (f1 x19089 x19089 x19089)) x19089)) (= y19061 (f2 x19087 (f1 x19089 x19089 x19089) x19089)) (= x19087 (f2 y19059 x19089 x19089))) 
    (and (= y19063 (f2 y19064 y19063 (f1 (f1 x19089 x19089 x19089) (f1 x19089 x19089 x19089) (f2 x19089 x19089 x19089)))) (= y19064 (f1 y19065 (f2 x19089 (f1 x19089 x19089 x19089) (f2 x19089 x19089 x19089)) (f2 (f1 x19089 x19089 x19089) (f2 x19089 x19089 x19089) (f2 x19089 x19089 x19089)))) (= y19065 (f2 y19066 (f1 (f1 x19089 x19089 x19089) (f2 x19089 x19089 x19089) (f1 x19089 x19089 x19089)) (f2 x19089 x19089 x19089))) (= y19066 (f2 y19067 (f1 x19089 x19089 x19089) (f1 x19089 x19089 x19089))) (= y19067 (f1 y19063 x19089 x19089))) 
    (and (= y19068 (f2 (f2 (f1 y19068 x19089 x19089) (f2 x19089 x19089 x19089) (f1 x19089 x19089 x19089)) y19069 (f1 x19089 (f1 x19089 x19089 x19089) (f2 x19089 x19089 x19089)))) (= y19069 (f2 y19070 x19089 (f2 x19089 x19089 x19089))) (= y19070 (f2 y19068 x19089 x19089))) 
    (and (= x19088 (f1 y19072 (f2 x19089 x19089 x19089) (f2 (f2 x19089 x19089 x19089) x19089 x19089))) (= y19072 (f1 y19073 x19089 (f1 x19089 x19089 x19089))) (= y19073 (f2 x19088 x19089 x19089))) 
    (and (= y19074 (f2 y19075 x19089 (f2 x19089 x19089 x19089))) (= y19075 (f1 x19082 x19089 x19089)) (= x19082 (f2 y19074 x19089 x19089))) (= x19090 (f2 x19090 x19090 x19089)) 
    (and (= y19078 (f2 x19083 (f2 x19089 (f1 (f2 x19089 x19089 x19089) (f2 x19089 x19089 x19089) (f2 x19089 x19089 x19089)) (f2 (f2 x19089 x19089 x19089) (f1 x19089 x19089 x19089) x19089)) x19089)) (= x19083 (f2 x19091 (f1 (f1 x19089 x19089 x19089) (f1 x19089 x19089 x19089) x19089) x19089)) (= x19091 (f2 y19081 (f2 x19089 x19089 x19089) (f1 x19089 x19089 x19089))) (= y19081 (f2 y19078 x19089 x19089)))))))
(check-sat)
