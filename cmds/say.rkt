#lang racket

(require cordian)

(cmd say ()
  #:desc "Repeats your message and deletes the original."
  #:exam "say hello world"
  #:logic (begin
           (reports "say command by ~a (~a)" (hash-ref (author ctx) 'username) (hash-ref (author ctx) 'id))
           (respond (string-join args " "))
           (when (and (hash-ref ctx 'channel_id #f) (hash-ref ctx 'id #f))
             (delete-message ctx))))
