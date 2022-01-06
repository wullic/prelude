;; color-theme
(disable-theme 'zenburn)

(setq-local cur-hour (nth 2 (decode-time)))
(if (or (> cur-hour 21) (< cur-hour 8))
    (setq prelude-theme 'vscode-dark-plus)
  (setq prelude-theme 'modus-operandi))

(set-frame-font "Hack-22" nil t)
;; (set-frame-font "monospace-15" nil t)
