;;; avy
(define-key prelude-mode-map (kbd "s-i a") 'ace-window)
(define-key prelude-mode-map (kbd "s-i w") 'avy-goto-word-1)
(define-key prelude-mode-map (kbd "s-i c") 'avy-goto-char)
(define-key prelude-mode-map (kbd "s-i j") 'avy-goto-char-timer)
(define-key prelude-mode-map (kbd "s-i y") 'avy-copy-line)
(define-key prelude-mode-map (kbd "s-i r") 'avy-copy-region)
(define-key prelude-mode-map (kbd "s-i l") `goto-line)
(define-key prelude-mode-map (kbd "s-i i") `avy-goto-char-in-line)

;;; Jump symbol definitnion/references
(define-key prelude-mode-map (kbd "s-j") nil)
(define-key prelude-mode-map (kbd "s-j d") 'lsp-find-definition)
(define-key prelude-mode-map (kbd "s-j r") 'lsp-find-references)

;;; Search
;; search
;; (define-key prelude-mode-map (kbd "s-e") 'isearch-repeat-forward)
(define-key prelude-mode-map (kbd "s-f") 'isearch-repeat-forward)
;; (define-key prelude-mode-map (kbd "s-d") 'isearch-repeat-backward)


;;; Edit skill & Cursor control
(define-key prelude-mode-map (kbd "s-k") 'crux-kill-whole-line)
(define-key prelude-mode-map (kbd "s-w") 'ace-window)
(global-set-key (kbd "s-e") 'er/expand-region)
(global-set-key (kbd "C-j") 'join-line)
;; (define-key key-translation-map (kbd "C-j") (kbd "RET"))
;; (define-key key-translation-map (kbd "C-j") (kbd "C-SPC"))
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "<backtab>") 'python-indent-shift-left)
;; (global-set-key (kbd "s-w") 'easy-kill)
(define-key key-translation-map (kbd "M-h") (kbd "M-DEL"))
;; newline
(global-set-key (kbd "C-o") `crux-smart-open-line-above)
(define-key prelude-mode-map (kbd "s-o") nil)
(global-set-key (kbd "s-o") 'crux-smart-open-line)
;; cursor control
(define-key prelude-mode-map (kbd "s-f") nil)
(define-key prelude-mode-map (kbd "s-f") 'forward-sexp)
(define-key prelude-mode-map (kbd "s-b") 'backward-sexp)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "s-<up>") 'drag-stuff-up)
(global-set-key (kbd "s-<down>") 'drag-stuff-down)
(global-set-key (kbd "s-<left>") 'previous-buffer)
(global-set-key (kbd "s-<right>") 'next-buffer)
(global-set-key (kbd "M-<left>") 'pop-global-mark)
(global-set-key (kbd "M-<right>") 'exchange-point-and-mark)


;;; Help menu
(global-set-key (kbd "C-x h") 'help-command)
(global-set-key (kbd "C-h") 'sp-backward-delete-char)



;;; undo-Redo
;; C-c <left>, C-c <right>
(global-set-key (kbd "C-u") 'undo-tree-undo)
(global-set-key (kbd "C-r") 'undo-tree-redo)


;;; Shell
(global-set-key (kbd "C-x s") 'shell)
;; (global-set-key (kbd "C-q") 'set-mark-command)
;; (global-set-key (kbd "s-s") 'save-buffer)


;;; Highlight symbol
(global-unset-key (kbd "s-h"))
(global-set-key (kbd "s-h h") 'highlight-symbol-at-point)
(global-set-key (kbd "s-h n") 'highlight-symbol-next)
(global-set-key (kbd "s-h p") 'highlight-symbol-prev)
(global-set-key (kbd "s-h s") 'highlight-sexp-mode)


;;; Parens matching
(defun my-step-out-forward ()
  "Step forward out of current list or string."
  (interactive)
  (forward-char)
  (if (nth 3 (syntax-ppss (point)))
      (progn
        (forward-char)
        (while (and (not (eobp)) (nth 3 (syntax-ppss (point))))
          (forward-char)))
    (up-list)))
(defun my-step-out-backward ()
  "Step backward out of current list or string."
  (interactive)
  (backward-char)
  (backward-up-list)
  )
(define-key prelude-mode-map (kbd "C-M-<up>") 'my-step-out-backward)
(define-key prelude-mode-map (kbd "C-M-<down>") 'my-step-out-forward)
