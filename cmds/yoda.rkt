#lang racket
(require cordian)

(cmd yoda ()
  #:desc "Rearranges the input to sound like Yoda."
  #:exam "yoda you must learn the ways of the force"
  #:logic (begin
           (let* ([words (string-split (string-join args " "))]
                  [len (length words)]
                  [split (if (> len 3) (quotient len 2) 1)]
                  [yoda (string-append (string-join (drop words split) " ") ", " (string-join (take words split) " "))])
             (respond (string-append yoda ". Hmmm.")))))
