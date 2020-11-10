;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jake Moss"
      user-mail-address "jake.moss@uqconnect.edu.au")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; Use pdf-tools to open PDF files


;; PERSONAL CONFIG
(load! "lisp/tab-jump-out/tab-jump-out")
;; pretiefy mode
(setq prettify-symbols-unprettify-at-point 'right-edge)

;; latex
(setq +latex-viewers '(pdf-tools))

(add-hook 'pdf-view-mode-hook
          (lambda ()
            (display-line-numbers-mode -1)))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq company-idle-delay 0.2)
            (tab-jump-out-mode 1)
            (turn-off-smartparens-mode)))

;; better smartparens for latex mode, smart parens is disbled by the above
(setq LaTeX-electric-left-right-brace t)

(defvar latex-enable-auto-fill t
  "Whether to use auto-fill-mode or not in tex files.")

(defvar latex-enable-folding nil
  "Whether to use `TeX-fold-mode' or not in tex/latex buffers.")

(defvar latex-nofill-env '("equation"
                           "equation*"
                           "align"
                           "align*"
                           "tabular"
                           "tikzpicture")
  "List of environment names in which `auto-fill-mode' will be inhibited.")


;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
           #'TeX-revert-document-buffer)

;; flyspell
(define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-wrapper)
;; (add-hook 'flyspell-mode-hook #'flyspell-correct-auto-mode)
 (after! flyspell
  (setq flyspell-lazy-idle-seconds 2))

;; flycheck

(setq flycheck-check-syntax-automatically '(mode-enabled new-line))
(setq flycheck-flake8rc "~/.config/flake8")

(add-hook 'lsp-after-initialize-hook
          (lambda ()
            (flycheck-add-next-checker 'lsp '(warning . python-flake8))))


(require 'dap-mode)
(require 'dap-ui)
(require 'dap-python)
(eval-after-load "python"
'(define-key python-mode-map (kbd "C-c C-c")
   (lambda () (interactive) (python-shell-send-buffer t) (python-shell-switch-to-shell))))
;; (setq dap-python-terminal "konsole -e ")
(defun debugging-mode ()
  (interactive)
  (dap-mode t)
  (dap-ui-mode t)
  (dap-tooltip-mode)
  (dap-ui-controls-mode 1)
  (dap-ui-sessions)
  (dap-ui-locals)
  (dap-ui-breakpoints)
  (dap-ui-repl)
  )

(defun stop-debugging-mode ()
  (interactive)
  (dap-delete-all-sessions)
  (dap-mode 0)
  (dap-ui-mode 0)
  (dap-ui-controls-mode 0)
  (delete-other-windows) ;; hide all the dap UI. I might want to delete the buffers as well.
  )
;; (dap-mode 1)
;; (dap-ui-mode 1)


;; (add-hook 'after-init-hook 'smartparens-global-mode)
(add-hook 'after-init-hook 'global-display-line-numbers-mode)

(setq display-line-numbers 'relative)
(setq-default display-line-numbers-type 'visual
        display-line-numbers-current-absolute t
        display-line-numbers-width 3
        display-line-numbers-widen t)

(eval-after-load "evil"
'(progn
(define-key evil-normal-state-map (kbd "SPC <left>") 'evil-window-left)
(define-key evil-normal-state-map (kbd "SPC <down>") 'evil-window-down)
(define-key evil-normal-state-map (kbd "SPC <up>") 'evil-window-up)
(define-key evil-normal-state-map (kbd "SPC <right>") 'evil-window-right)))

;; lsp
(setq lsp-ui-doc-delay 2)

;; Preview buffer after split
(setq evil-vsplit-window-right t
      evil-split-window-below t)

;; (defadvice! prompt-for-buffer (&rest _)
;;   :after '(evil-window-split evil-window-vsplit)
;;   (+ivy/switch-buffer))
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (ibuffer))

(setq +ivy-buffer-preview t)

(after! ivy-posframe
 (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
 (ivy-posframe-mode 1)
(setq ivy-posframe-parameters
      '((left-fringe . 8)
        (right-fringe . 8)))
 )

(map! :map evil-window-map
      "SPC" #'rotate-layout
       ;; Navigation
       "<left>"     #'evil-window-left
       "<down>"     #'evil-window-down
       "<up>"       #'evil-window-up
       "<right>"    #'evil-window-right
       ;; Swapping windows
       "C-<left>"       #'+evil/window-move-left
       "C-<down>"       #'+evil/window-move-down
       "C-<up>"         #'+evil/window-move-up
       "C-<right>"      #'+evil/window-move-right)

;; Company mode
(after! company
  (setq company-idle-delay 0.8
        company-minimum-prefix-length 2)
  (setq company-show-numbers t)
(add-hook 'evil-normal-state-entry-hook #'company-abort)) ;; make aborting less annoying.


;; Discord integration
(elcord-mode)


;; ;; https://github.com/syl20bnr/spacemacs/pull/179
;; (defvar company-mode/enable-yas t
;;   "Enable yasnippet for all backends.")

;; (defun company-mode/backend-with-yas (backend)
;;   (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
;;       backend
;;     (append (if (consp backend) backend (list backend))
;;             '(:with company-yasnippet))))

;; (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

;; ess
(set-company-backend! 'ess-r-mode '(company-R-args company-R-objects company-dabbrev-code :separate))

;; matlab-mode
 ;; (eval-after-load "matlab-mode"
 ;;    '(define-key matlab-mode-map (kbd "<C-return>") 'matlab-shell-run-region-or-line))
  (add-to-list 'auto-mode-alist '("\\.m\\'" . matlab-mode))
  (setq matlab-indent-function-body t)
  (matlab-cedet-setup)

;; disable '' auto pairing in electric-pair-mode for matlab-mode (' is transpose operator)
(sp-local-pair 'matlab-mode "'" nil :actions nil)

(map!
 :after matlab-mode
 :map evil-normal-state-local-map
 "C-<return>" nil)

(map!
 :map matlab-mode-map
 :n "C-<return>" #'matlab-shell-run-region-or-line)

(map!
 :after matlab-mode
 :map matlab-shell-mode-map
 "C-tab" nil)

;; expand region
(require 'expand-region)
(after! expand-region
  (map! :n "C-SPC" nil)
  (map! :n "C-SPC" #'er/expand-region)
  (map! :n "C-S-SPC" #'er/contract-region))

;; window managment
(global-set-key (kbd "M-<tab>") (lambda ()
                                (interactive)
                                (flip-window)))
(defun flip-window ()
  (interactive)
  (let ((win  (get-mru-window 'visible t t)))
    (if win
        (progn
          (select-frame-set-input-focus (window-frame win))
          (select-window win))
      (mode-line-other-buffer))))

(map!
 :after auto-yasnippet
 :map evil-normal-state-map
 "C-<tab>" nil)

(map! "C-<tab>" #'+workspace/other)

;; vterm
(after! vterm
        (define-key vterm-mode-map (kbd "C-g") #'vterm--self-insert))


;; change inside quotes
(after! evil
  (require 'evil-textobj-anyblock)
  (evil-define-text-object my-evil-textobj-anyblock-inner-quote
    (count &optional beg end type)
    "Select the closest outer quote."
    (let ((evil-textobj-anyblock-blocks
           '(("'" . "'")
             ("\"" . "\"")
             ("`" . "`")
             ("“" . "”"))))
      (evil-textobj-anyblock--make-textobj beg end type count nil)))

  (evil-define-text-object my-evil-textobj-anyblock-a-quote
    (count &optional beg end type)
    "Select the closest outer quote."
    (let ((evil-textobj-anyblock-blocks
           '(("'" . "'")
             ("\"" . "\"")
             ("`" . "`")
             ("“" . "”"))))
      (evil-textobj-anyblock--make-textobj beg end type count t)))

  (define-key evil-inner-text-objects-map "q" 'my-evil-textobj-anyblock-inner-quote)
  (define-key evil-outer-text-objects-map "q" 'my-evil-textobj-anyblock-a-quote))

;; company box fix for gccemacs
(after! company-box
  (advice-remove #'company-box--update-scrollbar #'+company-remove-scrollbar-a))
  (setq company-box-doc-enable nil)

;; multicursor ignored commands
(after! evil-mc
  (add-to-list
   'evil-mc-custom-known-commands
   '(ess-smart-comma . ((:default . evil-mc-execute-default-call)))))
