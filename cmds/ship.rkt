#lang racket
(require cordian)

(cmd ship ()
  #:desc "Generates a ship name and compatibility percentage."
  #:exam "ship Alice Bob"
  #:logic (begin
           (if (< (length args) 2)
               (respond "Please provide two names to ship.")
               (let* ([name1 (car args)]
                      [name2 (cadr args)]
                      [shipname (string-append (substring name1 0 (max 1 (quotient (string-length name1) 2)))
                                               (substring name2 (max 0 (- (string-length name2) (quotient (string-length name2) 2)))))]
                      [compat (+ 50 (random 51))])
                 (respond (format "~a ❤️ ~a\nShip name: ~a\nCompatibility: ~a%" name1 name2 shipname compat))))))
