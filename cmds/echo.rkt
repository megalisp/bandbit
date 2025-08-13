#lang racket

(require cordian)

(cmd echo ()
  #:desc "Repeats your message."
  #:exam "echo hello world"
  #:logic (begin
           (reports "echo command by ~a (~a)" (hash-ref (author ctx) 'username) (hash-ref (author ctx) 'id))
           (respond (string-join args " "))))
