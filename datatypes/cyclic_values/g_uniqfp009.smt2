(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T)))))
(assert (exists ((y963 T) (y952 T) (y959 T) (y951 T) (y950 T) (y964 T) (y965 T) (y966 T) (y967 T) (y960 T) (y958 T) (y962 T) (y970 T) (y955 T) (y954 T) (y957 T) (y956 T) (y968 T) (y969 T) (y953 T) (y961 T)) 
  (or 
    (and (= y950 (f1 y950 PLACEHOLDER)) (= y951 (f1 y951 PLACEHOLDER)) (distinct y950 y951)) 
    (and (= y952 (f1 (f1 y954 (f1 PLACEHOLDER PLACEHOLDER)) (f1 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER)))) (= y954 (f1 (f1 y955 (f1 PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER))) (= y955 (f1 y952 PLACEHOLDER)) (= y953 (f1 (f1 (f1 (f1 y956 (f1 PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER)) (f1 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER)))) (= y956 (f1 y953 PLACEHOLDER)) (distinct y952 y953)) 
    (and (= y957 (f1 y959 (f1 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y959 (f1 y960 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)))) (= y960 (f1 y961 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y961 (f1 y962 PLACEHOLDER)) (= y962 (f1 y957 PLACEHOLDER)) (= y958 (f1 y963 (f1 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y963 (f1 y964 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)))) (= y964 (f1 y965 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y965 (f1 y966 PLACEHOLDER)) (= y966 (f1 y958 PLACEHOLDER)) (distinct y957 y958)) 
    (and (= y967 (f1 y969 (f1 PLACEHOLDER PLACEHOLDER))) (= y969 (f1 y967 PLACEHOLDER)) (= y968 (f1 y970 (f1 PLACEHOLDER PLACEHOLDER))) (= y970 (f1 y968 PLACEHOLDER)) (distinct y967 y968)))))
(check-sat)
