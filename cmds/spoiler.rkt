#lang racket
(require cordian)

(cmd spoiler ()
  #:desc "Wraps the input in Discord spoiler tags and deletes the original message."
  #:exam "spoiler Darth Vader is Luke's father"
  #:logic (begin
           (let ([text (string-join args " ")])
             (respond (string-append "||" text "||"))
             (when (and (hash-ref ctx 'channel_id #f) (hash-ref ctx 'id #f))
               (delete-message ctx)))))
