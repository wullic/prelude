(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/")
              ;; '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
              ;; '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
              )
(package-initialize)

;; My packages
(setq prelude-packages (append '(
                                 solarized-theme
                                 cyberpunk-theme
                                 gruvbox-theme
                                 ample-theme
                                 color-theme-sanityinc-tomorrow
                                 drag-stuff
                                 elpy
				 tern
                                 highlight-symbol
                                 lsp-mode
                                 golden-ratio
                                 ;; idle-highlight-mode
                                 ) prelude-packages))
;; Install my packages
(prelude-install-packages)

;; elpy mode
;; (elpy-enable)

;; hightlight
;; (require 'highlight-symbol)
;; (global-set-key [(control f3)] 'ymbol)
;; (global-set-key [f3] 'highlight-symbol-next)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)
;; (add-hook 'prelude-python-mode 'idle-highlight-mode)

;; flycheck
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(python-pylint)))

;; lsp-mode
;; (add-hook 'python-mode-hook 'lsp-diagnostics-mode)
(require 'lsp-mode)
(setq lsp-diagnostics-provider :none)
;; (setq lsp-ui-sideline-show-diagnostics nil)
(setq lsp-ui-doc-show-with-mouse nil)
;; (setq lsp-pylsp-configuration-sources 'flake8)
;; (setq lsp-modeline-diagnostics-enable nil)
;; (setq lsp-modeline-code-actions-enable t)
;; (setq lsp-eldoc-enable-hover t)

;; python-mode
(setq python-shell-completion-native-disabled-interpreters '("python"))
(setq prelude-python-mode-set-encoding-automatically t)
(setq company-idle-delay 0.5)
(add-hook 'prelude-python-mode-hook #'lsp-deferred)
(setq lsp-headerline-breadcrumb-enable nil)  ;; disable headline
(setq-local flycheck-checkers '())  ;; set checker

;; avy-configs
(setq avy-timeout-seconds 0.25)
;; oywl-js-mode
(add-hook 'prelude-js-mode-hook #'lsp-deferred)

;; window-golden-ratio
;; (require 'golden-ratio)
;; (golden-ratio-mode 1)
;; (setq golden-ratio-adjust-factor .7
      ;; golden-ratio-wide-adjust-factor .5)
