#use "topfind";;
#require "lwt.simple-top";;

open Lwt;;

Lwt.state (Lwt.return 42);;
Lwt.state (Lwt.fail Exit);;

let waiter, wakener = Lwt.wait ();;
Lwt.state waiter;;
Lwt.wakeup wakener 42;;
Lwt.state waiter;;

