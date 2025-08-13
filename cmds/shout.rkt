#lang racket
(require cordian)

(cmd shout ()
  #:desc "Returns the input text in all caps with spaces between each letter."
  #:exam "shout hello world"
  #:logic (begin
           (let ([text (string-join args " ")])
             (respond (string-join (map string (string->list (string-upcase text))) " ")))))
