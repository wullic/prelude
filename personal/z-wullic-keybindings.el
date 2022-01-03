;;; helper function
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

;; my-projectile-ibuffer
(defun my-projectile-ibuffer (prompt-for-project)
  "Split window horizontally and open projectile-ibuffer"
  (interactive "P")
  (let ((width (/ (window-total-width) 2)))
    (split-window-horizontally (- width))
    (other-window 1)
    (projectile-ibuffer-by-project (projectile-project-root))))

;; my-eshell
(defun my-eshell ()
  "Split window vertically and open eshell"
  (interactive)
  (let ((height (/ (window-total-height) 4)))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell)))

;;; avy
(define-key prelude-mode-map (kbd "s-j") nil)
(define-key prelude-mode-map (kbd "s-j m") 'bookmark-set)
(define-key prelude-mode-map (kbd "s-j b") 'bookmark-jump)
(define-key prelude-mode-map (kbd "s-j w") 'avy-goto-word-1)
;; (define-key prelude-mode-map (kbd "s-j s") 'avy-goto-char)
(define-key prelude-mode-map (kbd "s-j j") 'avy-goto-char-timer)
(define-key prelude-mode-map (kbd "s-j c") 'avy-copy-line)
(define-key prelude-mode-map (kbd "s-j k") 'avy-kill-whole-line)
(define-key prelude-mode-map (kbd "s-j r") 'avy-kill-region)
(define-key prelude-mode-map (kbd "s-j l") `goto-line)
(define-key prelude-mode-map (kbd "s-j i") `avy-goto-char-in-line)
(define-key prelude-mode-map (kbd "s-j p") 'pop-global-mark)
(define-key prelude-mode-map (kbd "s-j s") 'exchange-point-and-mark)
(define-key prelude-mode-map (kbd "s-j a") 'my-step-out-backward)
(define-key prelude-mode-map (kbd "s-j e") 'my-step-out-forward)


;;; Jump symbol definitnion/references
(define-key prelude-mode-map (kbd "s-d") nil)
(define-key prelude-mode-map (kbd "s-d d") 'lsp-find-definition)
(define-key prelude-mode-map (kbd "s-d r") 'lsp-find-references)


;;; Search
;; search
(define-key prelude-mode-map (kbd "s-i f") 'isearch-forward)
(define-key prelude-mode-map (kbd "s-i s") 'isearch-backward)
(define-key prelude-mode-map (kbd "s-i g") 'counsel-git)
(define-key prelude-mode-map (kbd "s-i j") 'counsel-git-grep)
;; counsel find
(define-key prelude-mode-map (kbd "s-f") 'counsel-find-file)


;;; Edit skill & Cursor control
;; meow-mode
(define-key key-translation-map (kbd "C-i") (kbd "<escape>"))
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
(global-set-key (kbd "C-o") `meow-open-above)
(define-key prelude-mode-map (kbd "s-o") nil)
(global-set-key (kbd "s-o") 'meow-open-below)
;; buffer control
(define-key prelude-mode-map (kbd "s-u") nil)
(define-key prelude-mode-map (kbd "s-u u") 'revert-buffer)
(define-key prelude-mode-map (kbd "s-u p") 'previous-buffer)
(define-key prelude-mode-map (kbd "s-u n") 'next-buffer)
(define-key prelude-mode-map (kbd "s-u k") 'kill-buffer)
(define-key prelude-mode-map (kbd "s-u i") 'ibuffer)
(define-key prelude-mode-map (kbd "s-u b") 'ivy-switch-buffer)
(define-key prelude-mode-map (kbd "s-u I") 'projectile-ibuffer)
;; window conrtorl
(define-key prelude-mode-map (kbd "s-u s") 'crux-swap-windows)
(define-key prelude-mode-map (kbd "s-u 1") 'delete-other-windows)
(define-key prelude-mode-map (kbd "s-u 0") 'delete-window)
(define-key prelude-mode-map (kbd "s-u 2") 'split-window-below)
(define-key prelude-mode-map (kbd "s-u 3") 'split-window-right)
;; workgroups2
(define-key prelude-mode-map (kbd "s-u w c") 'wg-create-workgroup)
(define-key prelude-mode-map (kbd "s-u w o") 'wg-open-workgroup)
(define-key prelude-mode-map (kbd "s-u w k") 'wg-kill-workgroup)

;; (define-key prelude-mode-map (kbd "s-p I") nil)
;; (define-key prelude-mode-map (kbd "s-p I") 'my-projectile-ibuffer)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "s-<up>") 'drag-stuff-up)
(global-set-key (kbd "s-<down>") 'drag-stuff-down)
(global-set-key (kbd "s-<left>") 'previous-buffer)
(global-set-key (kbd "s-<right>") 'next-buffer)


;;; Help menu
(global-set-key (kbd "C-x h") 'help-command)
(global-set-key (kbd "C-h") 'sp-backward-delete-char)


;;; Highlight symbol
(global-unset-key (kbd "s-h"))
(global-set-key (kbd "s-h s-h") 'help-command)
(global-set-key (kbd "s-h h") 'highlight-symbol-at-point)
(global-set-key (kbd "s-h n") 'highlight-symbol-next)
(global-set-key (kbd "s-h p") 'highlight-symbol-prev)
(global-set-key (kbd "s-h s") 'highlight-sexp-mode)


;;; undo-Redo
;; C-c <left>, C-c <right>
(global-set-key (kbd "C-u") 'undo-tree-undo)
(global-set-key (kbd "C-r") 'undo-tree-redo)


;;; Shell
(global-set-key (kbd "C-x s") 'shell)
;; (global-set-key (kbd "C-q") 'set-mark-command)
;; (global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "C-x m") 'my-eshell)
