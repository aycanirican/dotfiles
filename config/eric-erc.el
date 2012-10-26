;; Join the a couple of interesting channels whenever connecting to Freenode.
(setq erc-autojoin-channels-alist '(("freenode.net"
                                     "#emacs" "#ruby" "#lisp" "#clojure"
                                     "#fluidinfo" "#haskell")))
;; set your nickname
(setq erc-nick "gridaphobe")

;; share your username (optional)
(setq erc-user-full-name "Eric Seidel")

(setq erc-autojoin-timing 'ident)

;; ignore join/part/quit spam
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

;; clean up the erc modeline
(setq erc-format-query-as-channel-p t
      erc-track-priority-faces-only 'all
      erc-track-faces-priority-list '(erc-error-face
                                      erc-current-nick-face
                                      erc-keyword-face
                                      erc-nick-msg-face
                                      erc-direct-msg-face
                                      erc-dangerous-host-face
                                      erc-notice-face
                                      erc-prompt-face))

;; always display a timestamp on the left, and only on the left
(setq erc-timestamp-format "[%H:%M] ")
(defun eric-erc-timestamp-left (string)
  (let* ((ct (current-time))
         (ts (erc-format-timestamp ct erc-timestamp-format)))
    (erc-insert-timestamp-left ts)))
(setq erc-insert-timestamp-function 'eric-erc-timestamp-left)

(provide 'eric-erc)
