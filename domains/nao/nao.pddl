(define (domain nao)
	(:requirements :strips :typing :fluents)
	(:types
		player robot child - player
		game
	)
	(:predicates
		(detected_child ?p - child)
		(greeted_child ?p - child)
		(explained_game ?e - game)
		(finished_game ?e - game)
		(said_gb_child ?p - child)
		(finished_session)
		(turn ?p - player)
		(change ?n - player ?p - player)
		(play_time)
	)
	(:functions
		(num_rounds ?e - game)
		(current_round ?e - game)
	)
	(:action NAO_detect_child
		:parameters (?p - child)
		:precondition (and (not (detected_child ?p)))
		:effect (and (detected_child ?p))
	)
	(:action NAO_greet_child
		:parameters (?p - child)
		:precondition (and (detected_child ?p)
			(not (greeted_child ?p)))
		:effect (and (greeted_child ?p))
	)
	(:action NAO_explains_game
		:parameters (?e - game)
		:precondition (and (forall
				(?p - child)
				(greeted_child ?p))
			(not (explained_game ?e)))
		:effect (and (explained_game ?e))
	)
	(:action play_round
		:parameters (?p - player ?e - game ?n - player)
		:precondition (and (explained_game ?e)
			(< (current_round ?e) (num_rounds ?e))
			(turn ?p) (change ?n ?p))
		:effect (and (increase (current_round ?e) 1)
			(not (turn ?p)) (turn ?n))
	)
	(:action no_more_rounds
		:parameters (?e - game)
		:precondition (and (= (current_round ?e) (num_rounds ?e)))
		:effect (and (finished_game ?e))
	)
	(:action NAO_say_gb
		:parameters (?p - child ?e - game)
		:precondition (and (finished_game ?e)
			(not (said_gb_child ?p)))
		:effect (and (said_gb_child ?p))
	)
	(:action end_session
		:parameters ()
		:precondition (and (forall
				(?p - child)
				(said_gb_child ?p)))
		:effect (and (finished_session))
	)
)