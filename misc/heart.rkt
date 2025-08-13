
#lang racket
(require cordian)
(require "lyrics.rkt")

(provide start-heartbeat)

;; Heartbeat function: posts a message to a channel every 60 seconds
(define (start-heartbeat client channel-id)
  (thread
   (lambda ()
     (let loop ([i 0])
       (with-handlers ([exn:fail? (lambda (e) (printf "[HEARTBEAT ERROR] ~a\n" e))])
         (respond (vector-ref still-alive-lyrics i) #:client client #:channel channel-id)
         (sleep 1800))
       (loop (modulo (add1 i) (vector-length still-alive-lyrics)))))))
