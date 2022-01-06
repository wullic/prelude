;;; init.el  --- initialize

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this file.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

;;---------------------------------------------------------------------
;; Init
;;---------------------------------------------------------------------

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(defvar current-user
  (getenv
   (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(message "Powering up... Be patient, Master %s!" current-user)

(when (version< emacs-version "24.4")
  (error "Requires at least GNU Emacs 24.4, but you're running %s" emacs-version))

;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

(setq inhibit-startup-echo-area-message t)

;;---------------------------------------------------------------------
;; Variables and Load Paths
;;---------------------------------------------------------------------

(defvar emacs-dir (file-name-directory "~/.emacs.d/")
  "The root dir of the Emacs distribution.")
(defvar etc-dir (expand-file-name "personal/etc" emacs-dir)
  "This directory houses files created by emacs")
(defvar lisp-dir (expand-file-name "personal/lisp" emacs-dir)
  "This directory houses core lisp")
(defvar site-lisp-dir (expand-file-name "personal/site-lisp" emacs-dir)
  "This directory houses user lisp and site lisp")

(unless (file-exists-p etc-dir)
  (make-directory etc-dir))

(if (file-exists-p (concat emacs-dir "elpa"))
  (setq elpa-dir (concat emacs-dir "elpa")))

(add-to-list 'load-path lisp-dir)
(add-to-list 'load-path site-lisp-dir)

;; load the custom file
;; (setq custom-file (concat persistent-dir "/custom.el"))
;; (load custom-file)

;; (require 'init-preload-local nil t)

;;---------------------------------------------------------------------
;; Core
;;---------------------------------------------------------------------

(message "Loading core...")


;;---------------------------------------------------------------------
;; Modules
;;---------------------------------------------------------------------

(message "Loading modules...")
(require 'init-packages)
(require 'init-meow)
(require 'init-company)
(require 'init-org)
(require 'init-embark)
(require 'init-vertico)
(require 'init-consult)
(require 'init-yasnippet)
(require 'init-lsp)
(require 'init-wullic)

;; load any custom user provided locals
;; (require 'init-local nil t)

(message "Ready to do thy bidding, Master %s!" current-user)

;;; init.el ends here
