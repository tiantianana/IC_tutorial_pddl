(define (problem p1)
        (:domain nao)
        (:objects
                nao - robot
                luca - child
                jara - child
                game1 game2 - game
        )
        (:init
                (change luca nao)
                (change jara luca)
                (change nao jara)
                (turn nao)
                (= (num_rounds game1) 5)
                (= (current_round game1) 0)
        )
        (:goal
                (finished_session)
        )
)