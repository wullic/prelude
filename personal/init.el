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

(defvar core-dir (expand-file-name "personal/core" emacs-dir)
  "The home of core functionality.")

(defvar modules-dir (expand-file-name "personal/modules" emacs-dir)
  "This directory houses all of the modules.")

(defvar persistent-dir (expand-file-name "personal/etc" emacs-dir)
  "This directory houses files created by emacs packages")

(defvar lisp-dir (expand-file-name "personal/lisp" emacs-dir)
  "This directory houses user lisp and site lisp")

(unless (file-exists-p persistent-dir)
  (make-directory persistent-dir))

(if (file-exists-p (concat emacs-dir "src"))
  (setq source-directory (concat emacs-dir "src")))

(add-to-list 'load-path core-dir)
(add-to-list 'load-path modules-dir)
(add-to-list 'load-path lisp-dir)

;; load the custom file
;; (setq custom-file (concat persistent-dir "/custom.el"))
;; (load custom-file)

;; (require 'init-preload-local nil t)

;;---------------------------------------------------------------------
;; Core
;;---------------------------------------------------------------------

(message "Loading core...")

;; (require 'core-bootstrap)
;; (require 'core-ui)
;; (when (eq system-type 'darwin) (require 'core-osx))
;; (require 'core-packages)
;; (require 'core-defuns)
;; (require 'core-paths)
(require 'core-packages)
;;---------------------------------------------------------------------
;; Modules
;;---------------------------------------------------------------------

(message "Loading modules...")

;; (require 'module-bbdb)
;; (require 'module-c)
;; (require 'module-company)
;; (require 'module-eldoc)
;; (require 'module-emacs-lisp)
;; (require 'module-evil)
;; (require 'module-git)
;; (require 'module-go)
;; (require 'module-multiple-cursors)
;; (require 'module-org)
;; (require 'module-projectile)
;; (require 'module-protobuf)
;; (require 'module-python)
;; (require 'module-restclient)
;; (require 'module-yaml)
;; (require 'module-yasnippet)
(require 'module-meow)
(require 'module-company)
(require 'module-org)
(require 'module-embark)
(require 'module-vertico)
(require 'module-consult)
(require 'module-wullic)

;; load any custom user provided locals
;; (require 'init-local nil t)

(message "Ready to do thy bidding, Master %s!" current-user)

;;; init.el ends here
