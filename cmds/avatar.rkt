#lang racket
(require cordian)

(cmd avatar ()
  #:desc "Shows user's avatar URL."
  #:exam "avatar"
  #:logic (begin
           (let* ([user (author ctx)]
                  [id (hash-ref user 'id)]
                  [avatar (hash-ref user 'avatar #f)])
             (reports "avatar command by ~a (~a)" (hash-ref user 'username) id)
             (respond (if avatar
                          (format "https://cdn.discordapp.com/avatars/~a/~a.png" id avatar)
                          "User has no custom avatar.")))))
