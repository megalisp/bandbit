#lang racket
(require cordian)

(cmd mock ()
  #:desc "Returns the input text in alternating upper/lowercase."
  #:exam "mock this is silly"
  #:logic (begin
           (let* ([text (string-join args " ")]
                  [mocked (list->string
                           (for/list ([c (in-string text)] [i (in-naturals)])
                             (if (even? i) (char-downcase c) (char-upcase c))))])
             (respond mocked))))
