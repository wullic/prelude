(use-package marginalia
  :ensure t
  :config (marginalia-mode))

(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  ;; Hack embark
)

(defun embark-which-key-indicator ()
"An embark indicator that displays keymaps using which-key.
The which-key help message will show the type and value of the
current target followed by an ellipsis if there are further
targets."
(lambda (&optional keymap targets prefix)
    (if (null keymap)
        (which-key--hide-popup-ignore-command)
    (which-key--show-keymap
    (if (eq (plist-get (car targets) :type) 'embark-become)
        "Become"
        (format "Act on %s '%s'%s"
                (plist-get (car targets) :type)
                (embark--truncate-target (plist-get (car targets) :target))
                (if (cdr targets) "…" "")))
    (if prefix
        (pcase (lookup-key keymap prefix 'accept-default)
            ((and (pred keymapp) km) km)
            (_ (key-binding prefix 'accept-default)))
        keymap)
    nil nil t (lambda (binding)
                (not (string-suffix-p "-argument" (cdr binding))))))))

(setq embark-indicators
'(embark-which-key-indicator
    embark-highlight-indicator
    embark-isearch-highlight-indicator))

(defun embark-hide-which-key-indicator (fn &rest args)
"Hide the which-key indicator immediately when using the completing-read prompter."
(which-key--hide-popup-ignore-command)
(let ((embark-indicators
        (remq #'embark-which-key-indicator embark-indicators)))
    (apply fn args)))

(advice-add #'embark-completing-read-prompter
            :around #'embark-hide-which-key-indicator)

(eval-when-compile
(defmacro my/embark-ace-action (fn)
    `(defun ,(intern (concat "my/embark-ace-" (symbol-name fn))) ()
    (interactive)
    (with-demoted-errors "%s"
        (require 'ace-window)
        (let ((aw-dispatch-always t))
        (aw-switch-to-window (aw-select nil))
        (call-interactively (symbol-function ',fn)))))))

(require 'embark)
(define-key embark-file-map     (kbd "o") (my/embark-ace-action find-file))
(define-key embark-buffer-map   (kbd "o") (my/embark-ace-action switch-to-buffer))
(define-key embark-bookmark-map (kbd "o") (my/embark-ace-action bookmark-jump))


(provide 'module-embark)