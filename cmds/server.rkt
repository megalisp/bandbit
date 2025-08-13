#lang racket

(require cordian)

(cmd server ()
  #:desc "Shows server name and ID."
  #:exam "server"
  #:logic (begin
           (let ([guild (guild-info ctx)])
             (reports "server command by ~a (~a)" (hash-ref (author ctx) 'username) (hash-ref (author ctx) 'id))
             (respond (format "Server name: ~a\nServer ID: ~a"
                              (hash-ref guild 'name)
                              (hash-ref guild 'id))))))
