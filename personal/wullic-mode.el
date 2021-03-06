(require 'crux)

(defvar wullic-magic-keymap
  (let ((map (make-sparse-keymap)))
    ;; (define-key map (kbd "a") 'crux-move-beginning-of-line)
    ;; (define-key map (kbd "b") 'backward-char)
    ;; (define-key key-translation-map (kbd "c") (kbd "C-c"))
    ;; (define-key key-translation-map (kbd "C-c") (kbd "c"))
    ;; (define-key map (kbd "d") 'sp-delete-char)
    ;; (define-key map (kbd "e") 'move-end-of-line)
    ;; (define-key map (kbd "f") 'forward-char)
    ;; (define-key map (kbd "g") 'keyboard-quit)
    ;; (define-key map (kbd "h") 'sp-backward-delete-char)
    ;; (define-key map (kbd "i") ')
    ;; (define-key map (kbd "j") ')
    ;; (define-key map (kbd "k") 'prelude-duckduckgo)
    ;; (define-key map (kbd "l") 'prelude-duckduckgo)
    ;; (define-key map (kbd "m") 'prelude-duckduckgo)
    ;; (define-key map (kbd "n") 'prelude-duckduckgo)
    ;; (define-key map (kbd "o") 'prelude-duckduckgo)
    ;; (define-key map (kbd "p") 'prelude-duckduckgo)
    ;; (define-key map (kbd "q") 'prelude-duckduckgo)
    ;; (define-key map (kbd "r") 'prelude-duckduckgo)
    ;; (define-key map (kbd "s") 'prelude-duckduckgo)
    ;; (define-key map (kbd "t") 'prelude-duckduckgo)
    ;; (define-key map (kbd "u") 'prelude-duckduckgo)
    ;; (define-key map (kbd "v") 'prelude-duckduckgo)
    ;; (define-key map (kbd "w") 'prelude-duckduckgo)
    ;; (define-key map (kbd "x") 'prelude-duckduckgo)
    ;; (define-key map (kbd "y") 'prelude-duckduckgo)
    ;; (define-key map (kbd "z") 'prelude-duckduckgo))
    ;; )
    map))


(define-minor-mode wullic-mode
  "Minor mode to wullic magic keybingds, congratulation"

  :init-value nil
  :lighter "wullic"
  :keymap wullic-magic-keymap
)

;;; wullic mode
(add-hook 'prog-mode-hook 'wullic-mode)

(provide 'wullic-mode)

;;; wullic-magic-mode
;; (require 'wullic-mode)
(defun wullic-magic ()
  (interactive)
  (define-key  wullic-magic-keymap (kbd "a") 'crux-move-beginning-of-line)
  (define-key  wullic-magic-keymap (kbd "b") 'backward-char)
  (define-key key-translation-map (kbd "c") (kbd "C-c"))
  (define-key  wullic-magic-keymap (kbd "d") 'sp-delete-char)
  (define-key  wullic-magic-keymap (kbd "e") 'move-end-of-line)
  (define-key  wullic-magic-keymap (kbd "f") 'forward-char)
  (define-key  wullic-magic-keymap (kbd "g") 'keyboard-quit)
  (define-key  wullic-magic-keymap (kbd "h") 'sp-backward-delete-char)
  (define-key key-translation-map (kbd "i") (kbd "C-;"))
  ;; (define-key map (kbd "j") ')
  ;; (define-key map (kbd "k") 'prelude-duckduckgo)
  ;; (define-key map (kbd "l") 'prelude-duckduckgo)
  ;; (define-key map (kbd "m") 'prelude-duckduckgo)
  ;; (define-key map (kbd "n") 'prelude-duckduckgo)
  ;; (define-key map (kbd "o") 'prelude-duckduckgo)
  ;; (define-key map (kbd "p") 'prelude-duckduckgo)
  ;; (define-key map (kbd "q") 'prelude-duckduckgo)
  ;; (define-key map (kbd "r") 'prelude-duckduckgo)
  ;; (define-key map (kbd "s") 'prelude-duckduckgo)
  ;; (define-key map (kbd "t") 'prelude-duckduckgo)
  ;; (define-key map (kbd "u") 'prelude-duckduckgo)
  ;; (define-key map (kbd "v") 'prelude-duckduckgo)
  ;; (define-key map (kbd "w") 'prelude-duckduckgo)
  ;; (define-key map (kbd "x") 'prelude-duckduckgo)
  ;; (define-key map (kbd "y") 'prelude-duckduckgo)
  ;; (define-key map (kbd "z") 'prelude-duckduckgo))
  ;; )
  )

(defun wullic-magic-disable()
  (interactive)
  (define-key  wullic-magic-keymap (kbd "a") nil)
  (define-key  wullic-magic-keymap (kbd "b") nil)
  (define-key key-translation-map (kbd "c") nil)
  (define-key  wullic-magic-keymap (kbd "d") nil)
  (define-key  wullic-magic-keymap (kbd "e") nil)
  (define-key  wullic-magic-keymap (kbd "f") nil)
  (define-key  wullic-magic-keymap (kbd "g") nil)
  (define-key  wullic-magic-keymap (kbd "h") nil)
  ;; (define-key map (kbd "i") ')
  ;; (define-key map (kbd "j") ')
  ;; (define-key map (kbd "k") 'prelude-duckduckgo)
  ;; (define-key map (kbd "l") 'prelude-duckduckgo)
  ;; (define-key map (kbd "m") 'prelude-duckduckgo)
  ;; (define-key map (kbd "n") 'prelude-duckduckgo)
  ;; (define-key map (kbd "o") 'prelude-duckduckgo)
  ;; (define-key map (kbd "p") 'prelude-duckduckgo)
  ;; (define-key map (kbd "q") 'prelude-duckduckgo)
  ;; (define-key map (kbd "r") 'prelude-duckduckgo)
  ;; (define-key map (kbd "s") 'prelude-duckduckgo)
  ;; (define-key map (kbd "t") 'prelude-duckduckgo)
  ;; (define-key map (kbd "u") 'prelude-duckduckgo)
  ;; (define-key map (kbd "v") 'prelude-duckduckgo)
  ;; (define-key map (kbd "w") 'prelude-duckduckgo)
  ;; (define-key map (kbd "x") 'prelude-duckduckgo)
  ;; (define-key map (kbd "y") 'prelude-duckduckgo)
  ;; (define-key map (kbd "z") 'prelude-duckduckgo))
  ;; )
  )
;; (global-set-key (kbd "C-i") 'wullic-magic)
;; (global-set-key (kbd "C-;") 'wullic-magic-disable)
