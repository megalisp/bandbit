#lang racket
(require cordian)

(cmd flip ()
  #:desc "Flip a coin N times. Usage: flip [times] (default 1, max 1000)."
  #:exam "flip 10"
  #:logic (begin
           (let* ([times-raw (if (and (pair? args) (string->number (car args))) (string->number (car args)) 1)])
             (if (or (not (integer? times-raw)) (< times-raw 1) (> times-raw 1000))
                 (respond "You can only flip between 1 and 1000 times (default is 1).")
                 (let* ([times times-raw]
                        [flips (for/list ([i (in-range times)]) (random 2))]
                        [heads (count zero? flips)]
                        [tails (- times heads)]
                        [results (list->string (map (lambda (x) (if (zero? x) #\H #\T)) flips))]
                        [summary (format "\nHeads Total: ~a\nTails Total: ~a" heads tails)])
                   (respond (string-append results summary)))))))
