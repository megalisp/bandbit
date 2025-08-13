#lang racket
(require cordian)

(cmd shoot ()
  #:desc "Play rock-paper-scissors with the bot. Usage: shoot [rock|paper|scissors]"
  #:exam "shoot rock"
  #:logic (begin
     (let* ([choices '("rock" "paper" "scissors")]
         [user (if (null? args) "" (string-downcase (car args)))]
         [bot (list-ref choices (random 3))])
       (cond
      [(not (member user choices)) (respond "Choose rock, paper, or scissors!")]
      [else
       (let* ([result (cond
              [(equal? user bot) "It's a tie!"]
              [(or (and (equal? user "rock") (equal? bot "scissors"))
                (and (equal? user "paper") (equal? bot "rock"))
                (and (equal? user "scissors") (equal? bot "paper"))) "You win!"]
              [else "You lose!"])])
         (respond (format "You chose: ~a\nBot chose: ~a\n~a" user bot result)))])
     )))
