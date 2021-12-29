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
                                 vue-mode
                                 highlight-indent-guides
                                 highlight-parentheses
                                 ;; idle-highlight-mode
                                 ) prelude-packages))
;; Install my packages
(prelude-install-packages)


;;; flycheck
;; Turn off specific checker
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc python-pylint lsp)))


;;; lsp-mode
(require 'lsp-mode)
;; (setq lsp-diagnostics-provider :none)
(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-modeline-diagnostics-enable t)
(setq lsp-ui-doc-show-with-mouse t)
;; Turn off headerline
(setq lsp-headerline-breadcrumb-enable nil)
;; Turn off code actions modeline
(setq lsp-modeline-code-actions-enable nil)
(setq lsp-ui-sideline-show-code-actions nil)
;; Turn off eldoc mouse hover
(setq lsp-eldoc-enable-hover nil)
;; Show prefix details in command line
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))


;;; python-mode
(setq python-shell-completion-native-disabled-interpreters '("python"))
(setq prelude-python-mode-set-encoding-automatically t)
(add-hook 'prelude-python-mode-hook #'lsp-deferred)
;; (setq lsp-pylsp-configuration-sources 'flake8)


;;; company-mode
(setq company-idle-delay 0.3)


;;; avy configuration
(setq avy-timeout-seconds 0.25)


;;; js/js2-mode
(add-hook 'prelude-js-mode-hook #'lsp-deferred)
;; Turn off js2 mode errors & warnings (we lean on eslint/standard)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)


;;; typescript-mode
(add-hook 'prelude-ts-mode-hook #'lsp-deferred)


;;; vue-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.vue\\'"    . vue-mode))
(add-hook 'vue-mode-hook #'lsp-deferred)


;;; highlight-sexp
;; (require 'highlight-sexp)
;; (add-hook 'prelude-js-mode-hook 'highlight-sexp-mode)
;; (setq highlight-parentheses-highlight-adjacent t)


;;; highlight parentheses
(require 'highlight-parentheses)
(add-hook 'prog-mode-hook (lambda ()
                            (unless (derived-mode-p 'emacs-lisp-mode)
                              (highlight-parentheses-mode))))


;;; highlight-indent-guides
(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'bitmap)
(setq highlight-indent-guides-bitmap-function 'highlight-indent-guides--bitmap-dots)
;; Turn off customize dots color
;; (setq highlight-indent-guides-auto-enabled nil)
;; ;; (set-face-background 'highlight-indent-guides-odd-face "darkgray")
;; ;; (set-face-background 'highlight-indent-guides-even-face "dimgray")
;; ;; (set-face-foreground 'highlight-indent-guides-character-face "dimgray")
