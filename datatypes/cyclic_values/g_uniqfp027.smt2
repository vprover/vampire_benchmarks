(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (exists ((y2945 T) (y2946 T) (y2965 T) (y2964 T) (y2958 T) (y2959 T) (y2963 T) (y2962 T) (y2954 T) (y2955 T) (y2956 T) (y2957 T) (y2950 T) (y2949 T) (y2952 T) (y2953 T) (y2948 T) (y2951 T) (y2947 T) (y2961 T) (y2960 T)) 
  (or 
    (and (= y2945 (f1 y2947)) (= y2947 (f1 y2945)) (= y2946 (f1 y2948)) (= y2948 (f1 y2946)) (distinct y2945 y2946)) 
    (and (= y2949 (f1 y2949)) (= y2950 (f1 y2950)) (distinct y2949 y2950)) 
    (and (= y2951 (f1 y2951)) (= y2952 (f1 y2952)) (distinct y2951 y2952)) 
    (and (= y2953 (f1 (f1 y2953))) (= y2954 (f1 y2955)) (= y2955 (f1 y2954)) (distinct y2953 y2954)) 
    (and (= y2956 (f1 y2956)) (= y2957 (f1 y2957)) (distinct y2956 y2957)) 
    (and (= y2958 (f1 (f1 y2958))) (= y2959 (f1 (f1 y2959))) (distinct y2958 y2959)) 
    (and (= y2960 (f1 y2960)) (= y2961 (f1 y2961)) (distinct y2960 y2961)) 
    (and (= y2962 (f1 y2964)) (= y2964 (f1 y2962)) (= y2963 (f1 y2965)) (= y2965 (f1 y2963)) (distinct y2962 y2963)))))
(check-sat)
