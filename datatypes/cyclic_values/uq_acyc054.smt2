(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T)))))
(assert (exists ((y5942 T) (y5943 T) (y5940 T) (y5941 T) (y5946 T) (y5947 T) (y5945 T) (y5948 T) (y5949 T) (y5939 T) (y5938 T) (y5950 T) (y5933 T) (y5931 T) (y5936 T) (y5935 T) (y5934 T)) (forall ((x5959 T) (x5960 T) (x5954 T) (x5955 T) (x5956 T) (x5957 T)) 
  (or (= y5931 x5955) (= x5959 (f1 x5959 x5960 x5960)) (= y5933 (f1 y5933 y5933 x5960)) 
    (and (= y5934 (f1 y5935 x5960 x5960)) (= y5935 (f1 y5934 x5960 x5960))) (= y5936 (f1 y5936 y5936 x5960)) (= x5956 (f1 x5956 x5956 x5960)) 
    (and (= y5938 (f1 y5939 (f1 (f1 x5960 x5960 x5960) (f1 x5960 x5960 x5960) (f1 x5960 x5960 x5960)) (f1 (f1 x5960 x5960 x5960) x5960 (f1 x5960 x5960 x5960)))) (= y5939 (f1 y5940 (f1 y5938 x5960 x5960) (f1 x5960 x5960 x5960))) (= y5940 (f1 y5941 (f1 x5960 x5960 x5960) (f1 (f1 x5960 x5960 x5960) (f1 x5960 x5960 x5960) x5960))) (= y5941 (f1 y5942 x5960 (f1 x5960 x5960 x5960))) (= y5942 (f1 y5938 x5960 x5960))) 
    (and (= y5943 (f1 x5954 (f1 x5960 x5960 x5960) x5960)) (= x5954 (f1 y5945 (f1 x5960 x5960 x5960) (f1 x5960 x5960 x5960))) (= y5945 (f1 y5943 x5960 x5960))) 
    (and (= y5946 (f1 y5947 x5960 (f1 x5960 x5960 x5960))) (= y5947 x5957)) 
    (and (= y5948 (f1 (f1 (f1 y5948 x5960 x5960) (f1 x5960 x5960 x5960) x5960) y5949 (f1 x5960 (f1 x5960 x5960 x5960) x5960))) (= y5949 (f1 y5950 x5960 x5960)) (= y5950 (f1 y5948 y5948 x5960)))))))
(check-sat)
