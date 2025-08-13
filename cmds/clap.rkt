#lang racket
(require cordian)

(cmd clap ()
  #:desc "Adds 👏 between every word."
  #:exam "clap this is great"
  #:logic (begin
           (respond (string-join args " 👏 "))))
