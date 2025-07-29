#lang racket

(require racket-cord
         racket/string
         racket/hash)

;; Get bot token from environment
(define bot-token (getenv "BOT_TOKEN"))

;; Create Discord client with necessary intents
(define bandibot
  (make-client bot-token
               #:auto-shard #t
               #:intents (list intent-guilds intent-guild-messages)))

;; Command prefixes (emoji string and fallback)
;; (/:bb: to get id. Per-server should need to be set)
(define prefixes (list "<:bb:1399848078692847676>" "🦝"))

;; Match prefix with optional space
(define (match-prefix content)
  (for/or ([p prefixes])
    (cond
      [(string-prefix? content p) p]
      [(string-prefix? content (string-append p " ")) p]
      [else #f])))

;; Helper: send message to channel
(define (say client channel content)
  (http:create-message client channel content))

;; Commands dispatch table
(define commands
  (hash
   "echo"
   (λ (client payload args)
     (say client (hash-ref payload 'channel_id) (string-join args " ")))

   "ping"
   (λ (client payload _args)
     (say client (hash-ref payload 'channel_id) "Pong!"))

   "server"
   (λ (client payload _args)
     (define guild-id (hash-ref payload 'guild_id #f))
     (if guild-id
         (let ([guild (http:get-guild client guild-id)])
           (say client
                (hash-ref payload 'channel_id)
                (format "Server name: ~a\nServer ID: ~a"
                        (hash-ref guild 'name)
                        guild-id)))
         (say client (hash-ref payload 'channel_id)
              "This command only works in servers.")))

   "help"
   (λ (client payload _args)
     (say client
          (hash-ref payload 'channel_id)
          (string-join
           (map (λ (cmd) (format "~a~a" (car prefixes) cmd))
                (hash-keys commands))
           "\n")))

   "avatar"
   (λ (client payload _args)
     (define user (hash-ref payload 'author))
     (define id (hash-ref user 'id))
     (define avatar (hash-ref user 'avatar #f))
     (define url (if avatar
                     (format "https://cdn.discordapp.com/avatars/~a/~a.png" id avatar)
                     "User has no custom avatar."))
     (say client (hash-ref payload 'channel_id) url))

   "say"
   (λ (client payload args)
     (when (not (empty? args))
       (define channel-id (hash-ref payload 'channel_id))
       (define message-id (hash-ref payload 'id))
       (define content (string-join args " "))
       (begin
         (http:delete-message client channel-id message-id)
         (say client channel-id content))))

   "reverse"
   (λ (client payload args)
     (define reversed
       (list->string
        (reverse
         (string->list
          (string-join args " ")))))
     (say client (hash-ref payload 'channel_id) reversed))))

;; Event handler for MESSAGE_CREATE
(on-event
 'raw-message-create bandibot
 (λ (_ws-client client payload)
   (define content (hash-ref payload 'content ""))
   (define author (hash-ref payload 'author))
   (define author-id (and author (hash-ref author 'id #f)))
   (define self-id (hash-ref (client-user client) 'id))

   (define used-prefix (match-prefix content))

   ;; Ignore messages from self and match prefix with or without space
   (when (and author-id
              used-prefix
              (not (string=? author-id self-id)))
     (define cmdline (string-trim (substring content (string-length used-prefix))))
     (define parts (string-split cmdline))
     (define cmd (string-downcase (car parts)))
     (define args (cdr parts))
     (define handler (hash-ref commands cmd #f))
     (when handler
       (handler client payload args)))))

;; Logger for Discord debug messages
(define dr (make-log-receiver discord-logger 'debug))
(thread
 (λ ()
   (let loop ()
     (define v (sync dr))
     (printf "[~a] ~a\n" (vector-ref v 0) (vector-ref v 1))
     (loop))))

;; Start the bot
(start-client bandibot)
