#lang racket
(require cordian)

(cmd choose ()
  #:desc "Randomly picks one of the provided options."
  #:exam "choose pizza burger sushi"
  #:logic (begin
           (if (null? args)
               (respond "Please provide options to choose from.")
               (respond (list-ref args (random (length args)))))))
