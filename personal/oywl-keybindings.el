(define-key prelude-mode-map (kbd "s-l") nil)
(define-key prelude-mode-map (kbd "s-l a") 'ace-window)
(define-key prelude-mode-map (kbd "s-l w") 'avy-goto-word-1)
(define-key prelude-mode-map (kbd "s-l c") 'avy-goto-char)
(define-key prelude-mode-map (kbd "s-l j") 'avy-goto-line)
(define-key prelude-mode-map (kbd "s-l y") 'avy-copy-line)
(define-key prelude-mode-map (kbd "s-l r") 'avy-copy-region)
(define-key prelude-mode-map (kbd "s-l l") `goto-line)
;; (define-key prelude-mode-map (kbd "s-o") nil)
;; (define-key key-translation-map (kbd "s-i") (kbd "C-x"))
;; (define-key key-translation-map (kbd "s-o") (kbd "C-c"))
;; (define-key key-translation-map (kbd "s-x") (kbd "M-x"))
(define-key prelude-mode-map (kbd "s-j") 'avy-goto-char-timer)
(define-key prelude-mode-map (kbd "s-k") 'crux-kill-whole-line)
;; (define-key prelude-mode-map (kbd "s-w") 'easy-kill)
;; (define-key prelude-mode-map (kbd "s-e") 'isearch-repeat-forward)
(define-key prelude-mode-map (kbd "s-f") 'isearch-repeat-forward)
;; (define-key prelude-mode-map (kbd "s-d") 'isearch-repeat-backward)

;; help menu
(global-set-key (kbd "s-h") 'highlight-symbol-at-point)
(global-set-key (kbd "C-x h") 'help-command)
;; (global-set-key (kbd "C-h") 'sp-backward-delete-char)
(define-key key-translation-map (kbd "C-h") (kbd "DEL"))

;; edit keyboard
;; (global-set-key (kbd "M-/") 'undo-tree-redo)
;; (global-set-key (kbd "s-m") 'er/expand-region)
(global-set-key (kbd "s-e") 'er/expand-region)
;; (global-set-key (kbd "C-i") 'avy-goto-char-timer)
;; (define-key key-translation-map (kbd "C-j") (kbd "RET"))
(define-key key-translation-map (kbd "C-j") (kbd "C-SPC"))
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "s-<left>") 'previous-buffer)
(global-set-key (kbd "s-<right>") 'next-buffer)
(global-set-key (kbd "s-<up>") 'drag-stuff-up)
(global-set-key (kbd "s-<down>") 'drag-stuff-down)
;; (global-set-key (kbd "ESC <left>") 'previous-buffer)
;; (global-set-key (kbd "ESC <right>") 'next-buffer)
(global-set-key (kbd "C-o") `crux-smart-open-line-above)
(global-set-key (kbd "C-u") 'undo-tree-undo)
(global-set-key (kbd "<backtab>") 'python-indent-shift-left)
(global-set-key (kbd "C-x s") 'shell)
(global-set-key (kbd "C-q") 'set-mark-command)

;; (global-set-key (kbd "s-s") 'save-buffer)


;; magit
