;; completion
(use-package orderless
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion))))
)

(use-package company
  :config
  (setq company-idle-delay 0.15)
)

(add-hook 'company-completion-started-hook
          (lambda (&rest ignore)
            (setq completion-styles
                  '(partial-completion substring initials flex))))
(add-hook 'company-after-completion-hook
          (lambda (&rest ignore)
            (setq completion-styles '(orderless))))

;; <tab> Tips
(with-eval-after-load 'company
  (define-key company-active-map (kbd "<tab>")
              #'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "<backtab>")
              (lambda () (interactive) (company-complete-common-or-cycle -1)))
)
;; Config different diffent backen in different mode
(defun my-text-mode-hook ()
  (setq-local company-backends '(company-ispell)))
(add-hook 'text-mode-hook #'my-text-mode-hook)

(provide 'module-company)