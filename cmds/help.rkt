#lang racket

(require cordian)

(cmd help ()
  #:desc "Lists all commands."
  #:exam "help"
  #:logic (begin
           (reports "help command by ~a (~a)" (hash-ref (author ctx) 'username) (hash-ref (author ctx) 'id))
           (respond
            (string-join
             (for/list ([cmd (in-list (commands ctx))])
               (format "~a~a" cmd-prefix cmd))
             "\n"))))
