(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/")
              ;; '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
              ;; '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
              )
(package-initialize)

;; My packages
(setq prelude-packages (append '(
                                 modus-themes
                                 solarized-theme
                                 ample-theme
                                 color-theme-sanityinc-tomorrow
                                 vscode-dark-plus-theme

                                 drag-stuff
                                 lsp-mode
                                 lsp-treemacs
                                 lsp-python-ms
                                 vue-mode
                                 highlight-symbol
                                 highlight-indent-guides
                                 highlight-parentheses
                                 htmlize
                                 ;; format-all
                                 direnv
                                 workgroups2
                                 meow
                                 wgrep
                                 ripgrep
                                 rg
                                 smart-mode-line
                                 ) prelude-packages))
;; Install my packages
(prelude-install-packages)

;;; wgrep-mode
(require 'wgrep)

;;; flyspell
;; (setq prelude-flyspell nil)

;;; flycheck
;; Turn off specific checker
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc python-pylint lsp)))

;;; Workgroups2
(require 'workgroups2)
(workgroups-mode 1)   ; put this one at the bottom of .emacs

(require 'yasnippet)
(yas-global-mode 1)

(require 'smart-mode-line)
(sml/setup)
(setq sml/theme 'light)

;;; lsp-mode
(require 'lsp)
(require 'lsp-python-ms)
;; UI settings
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

;; lsp server settings
(setq lsp-python-ms-auto-install-server t)
(add-hook 'prelude-python-mode-hook #'lsp-deferred)
(add-hook 'prelude-js-mode-hook #'lsp-deferred)
(add-hook 'prelude-ts-mode-hook #'lsp-deferred)
(add-hook 'vue-mode-hook #'lsp-deferred)

;;; Program Language
;;; python-mode
(setq python-shell-interpreter "python3")
(setq python-shell-completion-native-enable nil)
;; (setq python-shell-completion-native-disabled-interpreters '("python"))
(setq prelude-python-mode-set-encoding-automatically t)
;; (setq lsp-pylsp-configuration-sources 'flake8)


;;; js/js2-mode
;; Turn off js2 mode errors & warnings (we lean on eslint/standard)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
;; Typescript choose typescript language server in npm


;;; vue-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.vue\\'"    . vue-mode))


;;; Hightlight
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


;;; Direnv
(require 'direnv)
(direnv-mode)


;;; Format-all
;; (add-hook 'prog-mode-hook 'format-all-mode)

(provide 'core-packages)
