#lang racket

(require racket-cord)
 
(define bot-token (getenv "BOT_TOKEN"))
 
(define myclient (make-client bot-token #:auto-shard #t #:intents (list intent-guilds intent-guild-messages)))
 
(on-event
  'raw-message-create myclient
  (lambda (ws-client client payload)
    (unless (string=? (hash-ref (hash-ref payload 'author) 'id)
                      (user-id (client-user client)))
      (cond
        [(string-prefix? (hash-ref payload 'content) "!echo ")
         (http:create-message client (hash-ref payload 'channel_id)
                              (string-trim (hash-ref  payload 'content) "!echo " #:right? #f))]))))
 
 
 
(define dr (make-log-receiver discord-logger 'debug))
 
(thread
  (thunk
    (let loop ()
      (let ([v (sync dr)])
        (printf "[~a] ~a\n" (vector-ref v 0)
                (vector-ref v 1)))
      (loop))))
 
(start-client myclient)
