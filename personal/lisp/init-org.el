(org-babel-do-load-languages
 'org-babel-load-languages '((python . t)))
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/home.org"))

;;---------------------------------------------------------------------
;; Org-transclusion
;;---------------------------------------------------------------------
(require 'org-transclusion)
(org-transclusion-mode 1)

;;---------------------------------------------------------------------
;; Org-roam
;;---------------------------------------------------------------------

(provide 'init-org)
