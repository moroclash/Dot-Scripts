;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;; add melpa and marmalade repo 
(require 'package)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
 )
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(package-initialize)


(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    ein 
    flycheck
    py-autopep8
    smex
    beacon
    undo-tree
    autopair
    nlinum
    material-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)




;;set defoult theme
(load-theme 'material t)

;;set defoult name to emacs
(setq frame-title-format "emacs")

;;remove menu bar 
(menu-bar-mode -1)
;; Removing the tool bar
(tool-bar-mode -1)
;; Removing scroll bar
(scroll-bar-mode -1)

;;change cursore style
;;(set-defoult 'cursor-type 'hbar)

;; Column number
(setq column-number-mode t)
;; Hide startup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;;evaluate ido mode
(ido-mode)
;;evaluate colume number mode
(column-number-mode)
;;line number mode
(line-number-mode)


;;enable elpy package for python development
(elpy-enable)

;;to enable ien
;;(elpy-use-ipython)

;;(require 'ein)

;;to deactivate elpy defoult package for syntax checking called flymake
;; and activate package flycheck for realtime checkin
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


;;to evaluate pep8 when press "c-x c-s" to reformate the code
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


(setq backup-directory-alist `(("." . "~/.emacs_saves")))



;;set line numbers
(global-set-key (kbd "C-c n") 'nlinum-mode)

;;set neoTree
(global-set-key (kbd "C-c t") 'neotree)

;;auto complete
;;(auto-complete-mode)
;;(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "M-<tab>") 'company-mode)


;;revers buffer
(global-set-key (kbd "C-c r") 'revert-buffer)

;;evaluate smex
(global-set-key (kbd "M-x") 'smex)

;;beacon mode to don't lose my cursor
(beacon-mode 1)
(setq beacon-color "#666600")


;;make multiple cursore
(global-set-key (kbd "C-c c") 'multiple-cursors-mode)
(global-set-key (kbd "C-0") 'mc/mark-next-like-this)
(global-set-key (kbd "C-9") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-)") 'mc/unmark-next-like-this)
(global-set-key (kbd "C-(") 'mc/unmark-previous-like-this)


;;flyspell-mode to wrong words in all buffer
(global-set-key (kbd "M-6") 'flyspell-mode)
(global-set-key (kbd "M-7") 'flyspell-buffer)
(global-set-key (kbd "M-8") 'flyspell-auto-correct-word)
(global-set-key (kbd "M-5") 'ispell)
(global-set-key (kbd "M-4") 'ispell-word)











;;Set undo-tree shurt-cuts
(global-undo-tree-mode)
(global-set-key (kbd "M-/") 'undo-tree-visualize)

;;set switch-windo cuts
(global-set-key (kbd "C-.") 'switch-window)
;;(global-set-key (Kbd "C->") 'ace-jump-mode)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)


;;set auto complete for (),"",''
(autopair-global-mode)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(beacon-mode t)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" default)))
 '(global-hl-line-mode t)
 '(line-number-mode t)
 '(package-selected-packages
   (quote
    (web-completion-data web-beautify ensime web-mode lua-mode elpy better-defaults material-theme pdf-tools company multiple-cursors beacon focus neotree ample-zen-theme ample-theme smartparens autopair nlinum auto-complete smex switch-window undo-tree helm ##)))
 '(show-paren-mode nil)
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
