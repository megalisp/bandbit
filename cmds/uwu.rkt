#lang racket
(require cordian)

(cmd uwu ()
  #:desc "Converts the input text to uwu speak."
  #:exam "uwu hello friend"
  #:logic (begin
           (let* ([text (string-join args " ")]
                  [uwu (regexp-replace* #rx"[lr]" (regexp-replace* #rx"[LR]" text "W") "w")]
                  [uwu (regexp-replace* #rx"n([aeiou])" uwu "ny\\1")])
             (respond (string-append uwu " uwu")))))
