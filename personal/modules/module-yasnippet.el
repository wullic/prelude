(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (use-package yasnippet-snippets
    :ensure t)
  (yas-reload-all))

(provide 'module-yasnippet)
