(define (problem pfile01) (:domain puzzle)
(:objects   t1 t2 t3 t4 t5 t6 t7 t8 - block
            c1 c2 c3 c4 c5 c6 c7 c8 c9 - cells
)
(:INIT (adjacent c1 c2) (adjacent c2 c3)
        (adjacent c4 c5) (adjacent c5 c6)
        (adjacent c7 c8) (djacent c8 c9)
        (on t5 c1) (on t2 c2) (on t3 c6)
        (on t8 c4) (clear c5) (on t4 c6)
        (on t7 c7) (on t1 c8) (on t6 c9))

(:goal (and
        (on t1 c1) (on t2 c2) (on t3 c3)
        (on t4 c4) (on t5 c5) (on t6 c6)
        (on t7 c7) (on t8 c8) (clear c9))
        )
)