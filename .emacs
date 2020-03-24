;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;************************ Install require packages ****************************
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
    material-theme
    multiple-cursors
    evil
    evil-escape
    evil-matchit
    helm
    neotree
    all-the-icons
    js2-mode
    js2-refactor
    xref-js2
    web-mode
    json-mode
    company-tern
    rjsx-mode))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)
;;********************************************************************************


;;********************************** functions ***********************************
(defun quick-copy-line ()
  "Copy the whole line that point is on and move to the beginning of the next line.
    Consecutive calls to this command append each line to the
    kill-ring."
  (interactive)
  (let ((beg (line-beginning-position 1))
	(end (line-beginning-position 2)))
    (if (eq last-command 'quick-copy-line)
	(kill-append (buffer-substring beg end) (< end beg))
      (kill-new (buffer-substring beg end))))
  (beginning-of-line 2))
;;********************************************************************************







;;************************************ Evil-mode setting *************************
					; evil mappings

; * jk <3 no esc
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.1)

(evil-escape-mode)
(define-key evil-normal-state-map "\C-u" 'redo)
(defun newline-below ()
    (interactive)
    (move-end-of-line 1)
    (newline)
)
(define-key evil-normal-state-map "\C-n" 'newline-below)
(define-key evil-normal-state-map "U" 'redo)
;(define-key evil-normal-state-map "0" 'evil-end-of-visual-line)
;(define-key evil-normal-state-map "1" 'evil-beginning-of-visual-line)
(define-key evil-normal-state-map "\C-d" 'evil-scroll-down)
(define-key evil-normal-state-map "\C-u" 'evil-scroll-up)



(define-key evil-insert-state-map "\C-l" 'forward-char)
(define-key evil-insert-state-map "\C-h" 'backward-char)
(define-key evil-insert-state-map "\C-j" 'next-line)
(define-key evil-insert-state-map "\C-k" 'previous-line)
(define-key evil-insert-state-map "\C-p" 'yank)
(define-key evil-insert-state-map "\C-y" 'kill-whole-line)
(define-key evil-insert-state-map "\C-w" 'forward-word)
(define-key evil-insert-state-map "\C-b" 'backward-word)
(define-key evil-insert-state-map "\C-u" 'undo)
(define-key evil-insert-state-map "\C-f" 'delete-forward-char)
(define-key evil-insert-state-map "\C-d" 'delete-backward-char)
(define-key evil-insert-state-map "\C-n" 'newline-below)
(global-set-key (kbd "M-k")     'company-select-previous)
(global-set-key (kbd "M-j")     'company-select-next)




(global-evil-matchit-mode 1)




; make evil-mode work with buffer where not work
(with-eval-after-load 'evil
  ;; the following two lines enable vim  in "named" buffers
  ;; if there is a buffer vim does not work in;
  ;; add the buffer name in a line like the following.
  (add-to-list 'evil-buffer-regexps '("*Packages*" . normal))
  (add-to-list 'evil-buffer-regexps '("*Custom Themes*" . normal))
  (with-eval-after-load 'package
    ;; movement keys j,k,l,h set up for free by defaulting to normal mode.
    ;; mark, unmark, install
    (evil-define-key 'normal package-menu-mode-map (kbd "m") #'package-menu-mark-install)
    (evil-define-key 'normal package-menu-mode-map (kbd "u") #'package-menu-mark-unmark)
    (evil-define-key 'normal package-menu-mode-map (kbd "x") #'package-menu-execute))
  )

;;set evil mode as defoult
(evil-mode 1)
;;********************************************************************************



;;************************************* set defoult setting **********************
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

;; Hide startup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;;ignore non-user buffers
(setq ido-ignore-buffers '("\\` " "^\*" "^ " "*Completions*" "*Shell Command Output*"
			   "*Messages*" "Async Shell Command" "scratch"))
;;evaluate ido mode
(ido-mode t)


;;evaluate colume number mode
(column-number-mode 1)
;;line number mode
(line-number-mode 1)


;;set auto complete for (),"",''
;;(autopair-global-mode)
(electric-pair-mode 1)
;; make electric-pair-mode work on more brackets
(setq electric-pair-pairs '(
                            (?\" . ?\")
			    (?\' . ?\')
                            (?\{ . ?\})
			    (?\< . ?\>)
                            ))



;;beacon mode to don't lose my cursor
(setq beacon-color "#666600")
(beacon-mode 1)

;;to highlight line where cursor exist
(global-hl-line-mode t)

;;to allow undo/redo C-c left & C-c right
;;'(winner-mode t)


;;highlight <--->)
;;(setq show-paren-style 'mixed)
(set-face-foreground 'show-paren-mismatch "red")
(set-face-attribute 'show-paren-mismatch nil
                    :weight 'extra-bold :underline nil :overline nil :slant 'normal)
(set-face-background 'show-paren-match "#aaaaaa")
(set-face-attribute 'show-paren-match nil
		    :weight 'extra-bold :underline nil :overline nil :slant 'normal)
(setq show-paren-delay 0)
(show-paren-mode 1)


;; font size
(set-face-attribute 'default nil :height 100)

;; Disable alarms completely
(setq ring-bell-function 'ignore)


;;; Highlight text beyond 80th column
;(require 'whitespace)
;(setq whitespace-style '(face lines-tail))
;(setq whitespace-line-column 80)
;(global-whitespace-mode t)


;; Automatically removes trailing whitespaces when file is saved
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Disable backup
(setq backup-inhibited t)
;; Disable auto save
;(setq auto-save-default nil)


;;enable helm (complete menu)
(helm-mode t)


;;remember cursor position
(save-place-mode  1)


;; wrap long lines by word boundary, and arrow up/down move by visual line, etc
(global-visual-line-mode 1)


(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
;; set buckub folder
(setq backup-directory-alist `(("." . "~/.emacs_saves")))



;; change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)
;;********************************************************************************



;;************************************ setting python mode ***********************
;;enable elpy package for python development
(add-hook 'python-mode-hook 'elpy-enable)

;;enabel autocomplete using company
(add-hook 'python-mode-hook 'company-mode)

;;to enable ien
;;(add-hook 'python-mode-hook 'elpy-use-ipython)

;;(require 'ein)

;;to deactivate elpy defoult package for syntax checking called flymake
;; and activate package flycheck for realtime checkin
;;(when (require 'flycheck nil t)
;;  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;  (add-hook 'elpy-mode-hook 'flycheck-mode))
(add-hook 'python-mode-hook 'flycheck-mode)

;;to evaluate pep8 when press "c-x c-s" to reformate the code
(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
;;********************************************************************************





;;******************************* setting js mode ********************************
(require 'rjsx-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.mjs\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . rjsx-mode))
(add-hook 'rjsx-mode-hook
         (lambda ()
            (setq indent-tabs-mode nil) ;;Use space instead of tab
            (setq js-indent-level 2) ;;space width is 2 (default is 4)
            (setq js2-strict-missing-semi-warning nil))) ;;disable the semicolon warning

(define-key rjsx-mode-map (kbd "C-c C-t") 'helm-imenu)


(require 'js2-refactor)
;(require 'xref-js2)

(add-hook 'rjsx-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(add-hook 'rjsx-mode-hook 'xref-show-location-at-point)

(require 'company)
(require 'company-tern)

(add-to-list 'company-backends 'company-tern)
(add-hook 'rjsx-mode-hook (lambda ()
                          (tern-mode)
                          (company-mode)))

;;create file in root folder of project .tern-project
;; if auto-completion not work
;;{
;; "libs": [
;;   "jquery"
;; ],
;; "loadEagerly": [
;;   "./**/*.js"
;; ],
;; "dontLoad": [
;;   "./bower_components/"
;; ],
;; "plugins": {
;;   "requirejs": {
;;     "baseURL": "./"
;;   }
;;  }
;;}
;;********************************************************************************





;;********************************* update global emacs shortcuts ****************
;;set line numbers
(global-set-key (kbd "C-c n") 'nlinum-mode)

;;set neoTree
(global-set-key (kbd "C-c t") 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;;auto complete
;;(auto-complete-mode)
;;(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(global-set-key (kbd "M-<tab>") 'company-mode)

;;revers buffer
(global-set-key (kbd "C-c r") 'revert-buffer)

;;reload .emacs without restart app (eval-buffer)
(global-set-key (kbd "C-c e") 'eval-buffer)

;;evaluate smex
(global-set-key (kbd "M-x") 'smex)

;;make multiple cursore
;(global-set-key (kbd "C-c c") 'multiple-cursors-mode)
;(global-set-key (kbd "C-0") 'mc/mark-next-like-this)
;(global-set-key (kbd "C-9") 'mc/mark-previous-like-this)
;(global-set-key (kbd "C-)") 'mc/unmark-next-like-this)
;(global-set-key (kbd "C-(") 'mc/unmark-previous-like-this)

;;flyspell-mode to wrong words in all buffer
(global-set-key (kbd "M-6") 'flyspell-mode)
(global-set-key (kbd "M-7") 'flyspell-buffer)
(global-set-key (kbd "M-8") 'flyspell-auto-correct-word)
(global-set-key (kbd "M-5") 'ispell)
(global-set-key (kbd "M-4") 'ispell-word)

;;Set undo-tree shurt-cuts
(global-undo-tree-mode)
(global-set-key (kbd "M-/") 'undo-tree-visualize)
;; Redo. was yank
(global-set-key (kbd "C-'") 'redo)
;; Undo. was suspend-frame
(global-set-key (kbd "C-/") 'undo)


;;set switch-windo cuts
;(global-set-key (kbd "C-.") 'switch-window)
;;(global-set-key (Kbd "C->") 'ace-jump-mode)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
;;********************************************************************************








;;*********************************** Solve Some problems ************************
(defun xah-user-buffer-q ()
  "Return t if current buffer is a user buffer, else nil.
Typically, if buffer name starts with *, it's not considered a user buffer.
This function is used by buffer switching command and close buffer command, so that next buffer shown is a user buffer.
You can override this function to get your idea of “user buffer”.
version 2016-06-18"
  (interactive)
  (if (string-equal "*" (substring (buffer-name) 0 1))
      nil
    (if (string-equal major-mode "dired-mode")
        nil
      t
      )))

(defun xah-next-user-buffer ()
  "Switch to the next user buffer.
“user buffer” is determined by `xah-user-buffer-q'.
URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'
Version 2016-06-19"
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (not (xah-user-buffer-q))
          (progn (next-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))

(defun xah-previous-user-buffer ()
  "Switch to the previous user buffer.
“user buffer” is determined by `xah-user-buffer-q'.
URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'
Version 2016-06-19"
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (not (xah-user-buffer-q))
          (progn (previous-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))


(defun xah-next-emacs-buffer ()
  "Switch to the next emacs buffer.
“emacs buffer” here is buffer whose name starts with *.
URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'
Version 2016-06-19"
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (not (string-equal "*" (substring (buffer-name) 0 1))) (< i 20))
      (setq i (1+ i)) (next-buffer))))

(defun xah-previous-emacs-buffer ()
  "Switch to the previous emacs buffer.
“emacs buffer” here is buffer whose name starts with *.
URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'
Version 2016-06-19"
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (not (string-equal "*" (substring (buffer-name) 0 1))) (< i 20))
      (setq i (1+ i)) (previous-buffer))))

(global-set-key (kbd "C-x C-<left>") 'xah-next-emacs-buffer)
(global-set-key (kbd "C-x C-<right>") 'xah-previous-emacs-buffer)
(global-set-key (kbd "C--") 'xah-previous-user-buffer)
(global-set-key (kbd "C-=") 'xah-next-user-buffer)


;;********************************************************************************


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (all-the-icons switch-window smex py-autopep8 nlinum multiple-cursors material-theme helm flyspell-lazy flycheck evil elpy ein better-defaults beacon autopair))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'erase-buffer 'disabled nil)
