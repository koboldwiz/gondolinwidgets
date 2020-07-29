(load "functor.scm") ;; from the gondolinutil package

(define (make-xdraw)
	(let ((*fill-rectangle-functor (make-functor 
			;; fill-rectangle from scx might also be used
				(lambda (dpy win gc x y w h)
					(let ((points (* w h)))
						(do ((xx x (+ xx 1)))
						((= xx points) #t)
						(draw-point dpy win gc xx (remainder xx h)))))))
		(*draw-functor (make-functor (lambda (dpy win gc) ))) ;; FIXME 
		)	

	(define (get-x-draw-functor)
		*draw-functor)

	(define (set-x-draw-functor! f)
		(set! *draw-functor f))

	(define (draw dpy win gc x y  w  h)
		((*draw-functor 'do) (list dpy win gc x y w h)))
		

	(define (get-x-fill-rectangle-functor)
		*fill-rectangle-functor)

	(define (set-x-fill-rectangle-functor! f)
		(set! *fill-rectangle-functor f))

	(define (fill-rectangle2 dpy win gc x y  w  h) ;; NOTE : scx contains fill-rectangle
		((*fill-rectangle-functor 'do) (list dpy win gc x y w h)))
		

	(define (dispatch msg)
		(cond ((eq? msg 'get-draw) get-x-draw-functor)
			((eq? msg 'set-draw!) set-x-draw-functor!)
			((eq? msg 'draw) draw)
			((eq? msg 'get-fill-rectangle) get-x-fill-rectangle-functor)
			((eq? msg 'set-fill-rectangle!) set-x-fill-rectangle-functor!)
			((eq? msg 'fill-rectangle) fill-rectangle2)
			(else (display "make-xdraw : message not understood : ")
				(display msg)(newline))))

	dispatch))
