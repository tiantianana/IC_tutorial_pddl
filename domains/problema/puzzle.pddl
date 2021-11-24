;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Problema inventado
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain TILES)
	(:requirements :strips :typing)
	(:types
		cell tile
	)
	(:predicates
		(on ?x - tile ?y - cell)
		(clear ?x - cell)
		(adjacent ?y - cell ?z - cell)
	)

	(:action move
		:parameters (?x - tile ?y - cell ?z - cell)
		:precondition (and (on ?x ?y) (clear ?z) (adjacent ?y ?z))
		:effect (and (on ?x ?z)
			(clear ?y)
			(not (on ?x ?y))
			(not (clear ?z)))
	)
)