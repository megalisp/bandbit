#lang racket
(require cordian)

(cmd sarcasm ()
  #:desc "Randomly capitalizes letters for a sarcastic effect."
  #:exam "sarcasm this is so cool"
  #:logic (begin
           (let* ([text (string-join args " ")]
                  [s (list->string (for/list ([c (in-string text)])
                                    (if (zero? (random 2)) (char-upcase c) (char-downcase c))))])
             (respond s))))
