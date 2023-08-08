;; Ctrl-X -> '+' increase font
;; Meta \ -> delete all sapce
;; double semi-colon is comment

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-hl-line-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   '(("melpa" . "https://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")))
 '(package-selected-packages
   '(company-restclient jedi expand-region hungry-delete beacon auto-complete counsel org-bullets which-key try use-package slime-volleyball slime-company lsp-ui lsp-dart hover flycheck flutter ediprolog)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

;; display line number node
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
;;	     '("melpa" . "https://melpa.milkbox.net/packages/")
	     )

(package-initialize)

;; Bootstap 'use-packake
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(use-package try
  :ensure t)

;; Crtl + x and wait, it will suggest next key
(use-package which-key
  :ensure t
  :config (which-key-mode))


;; org-mode stuff
(use-package org-bullets
  :ensure t
  :config 
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; C-x b will help to navigate to files easier
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; nicer interface for list-buffers
;;(defalias 'list-buffers 'ibuffer)
(defalias 'list-buffers 'ibuffer-other-window)


;; C-x and in each buffer we can see a number to switch to
(use-package ace-window
  :ensure t
  :init
  (progn
  (global-set-key [remap other-window] 'ace-window)
  (custom-set-faces
  '(aw-leading-char-face
  ((t (:inherit ace-jump-face-foreground :height 3.0)))))
))

;; it looks like counsel is a requirement for swiper
;; search in a file and file
(use-package counsel
  :ensure t
)

(use-package swiper
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-load-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  ))  

;; quick way to navigate within file
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))


;; auto complete
(use-package auto-complete
  :ensure t
  :init
  (progn
  (ac-config-default)
  (global-auto-complete-mode t)
  ))


;; load theme
(load-theme 'wombat t)

;; org init file
;; group init config as lisp code inside org block so we can use tab to expand them


;; misc package
(use-package beacon
	     :ensure t
	     :config
	     (beacon-mode 1)
	     (setq beacon-color "#666600")
	     )

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

;; press C-= to expand select
(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

;; python
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup)
)
  
;; rest client

(use-package restclient
  :ensure t)
(use-package company-restclient
  :ensure t
  :config
  (add-to-list 'company-backends 'company-restclient))




