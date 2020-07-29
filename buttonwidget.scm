(load "xdraw.scm")

(define (make-button-widget x y w h)
	(let ((*widget (make-widget x y w h))
		(*xdraw (make-xdraw))) 

	(define (draw-button dpy win gc x y w h)
		((*xdraw 'fill-rectangle) dpy win gc x y w h)))

	(define (draw-widget)
		(draw-button))

	(define (resize-widget w h)
		((*widget 'resize) w h))

	(define (dispatch msg)
		(cond ((eq? msg 'draw) draw-widget)
			((eq? msg 'resize) resize-widget)
			(else (display "make-button-widget : message not understood : ")
				(display msg)(newline))))

	dispatch))
