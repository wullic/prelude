;; color-theme
(disable-theme 'zenburn)

(setq cur-hour (nth 2 (decode-time)))
(if (or (> cur-hour 22) (< cur-hour 7))
    (setq prelude-theme 'vscode-dark-plus)
  (setq prelude-theme 'modus-operandi))

(set-frame-font "Hack-22" nil t)
;; (set-frame-font "monospace-15" nil t)
