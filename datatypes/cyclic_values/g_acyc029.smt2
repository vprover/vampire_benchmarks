(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T))
  (f4 (proj0f4 T) (proj1f4 T) (proj2f4 T) (proj3f4 T)))))
(assert (exists ((y3072 T) (y3073 T) (y3059 T) (y3056 T) (y3057 T) (y3069 T) (y3068 T) (y3067 T) (y3066 T) (y3058 T) (y3064 T) (y3063 T) (y3062 T) (y3061 T) (y3060 T) (y3074 T) (y3070 T) (y3071 T) (y3065 T)) 
  (or 
    (and (= y3056 (f1 y3057 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y3057 (f3 y3058 (f3 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y3058 (f4 y3059 y3056 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER))) (= y3059 (f2 y3056 PLACEHOLDER))) 
    (and (= y3060 (f2 y3061 PLACEHOLDER)) (= y3061 (f4 (f3 y3060 PLACEHOLDER PLACEHOLDER PLACEHOLDER) y3062 PLACEHOLDER PLACEHOLDER)) (= y3062 (f2 y3060 PLACEHOLDER))) 
    (and (= y3063 (f1 y3064 PLACEHOLDER PLACEHOLDER)) (= y3064 (f4 y3063 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) y3065 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y3065 (f3 y3063 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y3066 (f2 y3066 PLACEHOLDER)) 
    (and (= y3067 (f4 y3068 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y3068 (f2 y3067 PLACEHOLDER))) 
    (and (= y3069 (f4 y3070 PLACEHOLDER (f1 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER)) (= y3070 (f1 y3071 (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y3071 (f2 y3069 PLACEHOLDER))) (= y3072 (f4 (f1 (f3 y3072 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 y3072 PLACEHOLDER) (f4 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) 
    (and (= y3073 (f1 y3074 PLACEHOLDER PLACEHOLDER)) (= y3074 (f2 y3073 PLACEHOLDER))))))
(check-sat)
