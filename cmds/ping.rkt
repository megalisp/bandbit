#lang racket

(require cordian)

(cmd ping ()
  #:desc "Replies with Pong!"
  #:exam "ping"
  #:logic (begin
           (reports "ping command by ~a (~a)" (hash-ref (author ctx) 'username) (hash-ref (author ctx) 'id))
           (respond "Pong!")))
