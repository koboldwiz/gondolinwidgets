(define (make-widget x y w h)
	(let ((*x x)
		(*y y)
		(*width w)
		(*height h)
		) 

	(define (draw-widget)
		#f)

	(define (move-widget x y)
		(set! *x x)
		(set! *y y))

	(define (resize-widget w h)
		(set! *width w)
		(set! *height h))

	(define (dispatch msg)
		(cond ((eq? msg 'draw) draw-widget)
			((eq? msg 'resize) resize-widget)
			((eq? msg 'resize) move-widget)
			((eq? msg 'x) get-x)
			((eq? msg 'y) get-y)
			((eq? msg 'w) get-width)
			((eq? msg 'h) get-height)
			;; set with a move and resize
			(else (display "make-widget : message not understood : ")
				(display msg)(newline))))

	dispatch))
