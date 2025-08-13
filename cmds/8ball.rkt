#lang racket

(require cordian)

(cmd 8ball ()
  #:desc "Ask the magic 8-ball a question."
  #:exam "8ball Will I win?"
  #:logic (begin
           (let* ((answers (vector
                            "It is certain."
                            "It is decidedly so."
                            "Without a doubt."
                            "Yes – definitely."
                            "You may rely on it."
                            "As I see it, yes."
                            "Most likely."
                            "Outlook good."
                            "Yes."
                            "Signs point to yes."
                            "Reply hazy, try again."
                            "Ask again later."
                            "Better not tell you now."
                            "Cannot predict now."
                            "Concentrate and ask again."
                            "Don't count on it."
                            "My reply is no."
                            "My sources say no."
                            "Outlook not so good."
                            "Very doubtful."))
                  (choice (vector-ref answers (random (vector-length answers)))))
             (reports "8ball command by ~a (~a)" (hash-ref (author ctx) 'username) (hash-ref (author ctx) 'id))
             (respond choice))))
