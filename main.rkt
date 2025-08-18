#!/usr/bin/env racket
#lang racket

(require cordian)
(require "stuff.rkt")


 (define bot-client
       (bot
        #:startup-message
           #(
              "Hello! This is Bandbit, Megalisp's Racket Based Discord bot."
              "This is a novelty bot, currently being racoon-dogfooded at the"
              "MEGAPLEX community server: https://discord.com/invite/6Re3dCKRgV"
              "If you want to run this locally:"
               "1. Set the BOT_TOKEN environment variable."
               "2. Make sure you have Racket installed and in your PATH."
               "3. Run ./main.rkt to start the bot."
            )
       #:token (getenv "BOT_TOKEN")
       #:intents (list intent-guilds
                       intent-guild-messages
                       intent-message-content
                       intent-guild-message-reactions
                       intent-guild-members)
       #:debug-bot-token #f
       #:debug-event-logger #t
       #:debug-responses #t))

  ;; See what this actually is / is needed?
  ;;(make-client bot-token
  ;;             #:auto-shard #t


(start-command-dispatcher bot-client)

;; Command prefixes (Need to add emoji string and  raccoon as the fallback)
;; (/:bb: to get id. Per-server should need to be set)
;; Used to be able to do:
;;(define prefixes (list "<:bb:1399852656876458076>" "🦝"))
(set-cmd-prefix! "🦝")


(rec #:chan-id "1397292532240748574"
  #:outputs "micro"
  #:full-path "/var/room/bandbit/.bandbit/REC/"
  #:disp-timestamp #t
  #:disp-guild #t
  #:disp-channel #t
  #:disp-username #t
  #:newline #t
  #:buffer #t
  #:only-user "1387175046522339328")


(start-heartbeat bot-client "1403469527559438386") ;; #heart channel ID


(debug-log "BOT" "Starting bot client...")
(start-client bot-client)


(debug-log "BOT" "start-client returned (this should not happen unless the client stops).")
