;; FIXME : maybe use functor.scm from gondonlinutil and a rectangle function
;; or smalltalk morphs e.g. fill a non-rectangle widget 

(define (make-xdraw)
	(let ((*fill (lambda (dpy win gc x y w h)
			(let ((points (* w h)))
			(do ((xx x (+ xx 1)))
				((= xx points) #t)
				(draw-point dpy win gc xx (remainder xx h))))))
		(*draw (lambda (dpy win gc) )) ;; FIXME 
		) 

	(define (get-x-drawing-function)
		*draw)

	(define (set-x-drawing-function! f)
		(set! *draw f))

	(define (fill-x-drawing-function dpy win gc x y  w  h)
		(*fill dpy win gc x y w h)	
		)

	(define (dispatch msg)
		(cond ((eq? msg 'get) get-x-drawing-function)
			((eq? msg 'set!) set-x-drawing-function!)
			((eq? msg 'fill) fill-x-drawing-function)
			(else (display "make-xdraw : message not understood : ")
				(display msg)(newline))))

	dispatch))
