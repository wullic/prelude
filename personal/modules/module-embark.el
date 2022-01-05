(use-package marginalia
  :ensure t
  :config (marginalia-mode))

(use-package embark
  :ensure t
  :bind
  (("C-s-." . embark-act-noquit)
   ("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
)
(require 'embark)

(use-package embark-consult
  ;; Consult users will also want the embark-consult package.
  :ensure t
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))


;;---------------------------------------------------------------------
;; Embark action no quit, I think it's better and set default
;;---------------------------------------------------------------------
(defun embark-act-noquit ()
  "Run action but don't quit the minibuffer afterwards."
  (interactive)
  (let ((embark-quit-after-action nil))
    (embark-act)))

;;---------------------------------------------------------------------
;; Showing info about available targets and actions
;;---------------------------------------------------------------------
;; which-key-indicator, delete because of BUG

;;---------------------------------------------------------------------
;; Definition actions for targets
;;---------------------------------------------------------------------
;; embark-ace-action
(eval-when-compile
(defmacro my/embark-ace-action (fn)
    `(defun ,(intern (concat "my/embark-ace-" (symbol-name fn))) ()
    (interactive)
    (with-demoted-errors "%s"
        (require 'ace-window)
        (let ((aw-dispatch-always t))
        (aw-switch-to-window (aw-select nil))
        (call-interactively (symbol-function ',fn)))))))

;; embark-split-action
(eval-when-compile
  (defmacro my/embark-split-action (fn split-type)
    `(defun ,(intern (concat "my/embark-"
                             (symbol-name fn)
                             "-"
                             (car (last  (split-string
                                          (symbol-name split-type) "-"))))) ()
       (interactive)
       (funcall #',split-type)
       (call-interactively #',fn))))

(define-key embark-file-map     (kbd "o") (my/embark-ace-action find-file))
(define-key embark-buffer-map   (kbd "o") (my/embark-ace-action switch-to-buffer))
(define-key embark-bookmark-map (kbd "o") (my/embark-ace-action bookmark-jump))

(define-key embark-file-map     (kbd "2") (my/embark-split-action find-file split-window-below))
(define-key embark-buffer-map   (kbd "2") (my/embark-split-action switch-to-buffer split-window-below))
(define-key embark-bookmark-map (kbd "2") (my/embark-split-action bookmark-jump split-window-below))

(define-key embark-file-map     (kbd "3") (my/embark-split-action find-file split-window-right))
(define-key embark-buffer-map   (kbd "3") (my/embark-split-action switch-to-buffer split-window-right))
(define-key embark-bookmark-map (kbd "3") (my/embark-split-action bookmark-jump split-window-right))

;;---------------------------------------------------------------------
;; Personal customize
;;---------------------------------------------------------------------
;; Showing embark actions in keycast-mode
(defun store-action-key+cmd (cmd)
  (setq keycast--this-command-keys (this-single-command-keys)
        keycast--this-command cmd))

(advice-add 'embark-keymap-prompter :filter-return #'store-action-key+cmd)

(defun force-keycast-update (&rest _)
  (force-mode-line-update t))

(dolist (cmd '(embark-act embark-become))
  (advice-add cmd :before #'force-keycast-update))


;; Show the current Embark target types in the modeline
(defvar embark--target-mode-timer nil)
(defvar embark--target-mode-string "")

(defun embark--target-mode-update ()
  (setq embark--target-mode-string
        (if-let (targets (embark--targets))
            (format "[%s%s] "
                    (propertize (symbol-name (plist-get (car targets) :type)) 'face 'bold)
                    (mapconcat (lambda (x) (format ", %s" (plist-get x :type)))
                               (cdr targets)
                               ""))
          "")))

(define-minor-mode embark-target-mode
  "Shows the current targets in the modeline."
  :global t
  (setq mode-line-misc-info (assq-delete-all 'embark-target-mode mode-line-misc-info))
  (when embark--target-mode-timer
    (cancel-timer embark--target-mode-timer)
    (setq embark--target-mode-timer nil))
  (when embark-target-mode
    (push '(embark-target-mode (:eval embark--target-mode-string)) mode-line-misc-info)
    (setq embark--target-mode-timer
          (run-with-idle-timer 0.1 t #'embark--target-mode-update))))


(provide 'module-embark)
