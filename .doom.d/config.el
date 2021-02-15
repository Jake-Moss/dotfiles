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
(setq doom-theme 'doom-palenight)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


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

(defun what-we-do-every-night-pinky ()
  (put-text-property
   (point)
   (progn
     (mapc (lambda (line)
             (insert
              (+doom-dashboard--center
               +doom-dashboard--width
               (let ((extra (max 0 (- +doom-dashboard--width (length line)))))
                 (concat line (make-string extra 32))))
              " \n"))
           '("Are you pondering what I'm pondering, Pinky?"
             ""
             "                          ,,,        !/:. "
             "                         /::\\\".      !!::: "
             "                         :::::\\\".  ,\" \\:,:: "
             "                         ::::::\\ \". ,\",\"\\::. "
             "                         \\:::::\":\\ \"/\"\"v' :' "
             "                          !::::\\   !    \\ \\   __ "
             "                           \"::::\\  \\     ! \\.&&&&, "
             "                              ,\" __ \",  cd,&&&&&&' "
             "                              \\    \". \"\" / \\&&&\"                       _,--- "
             "                                \"\",__\\_        /                    _,:\"::::: "
             "                              _,\" ,\"\"  ,-,__,/\":,_                ,\",\"::::::: "
             "                           _,\"  ,\"     `''   ::::,\",__,,----,,__,\" /::::::::: "
             "                        ,\"   ,\".__,          \\:::,\"            \"  /:::\":::::/ "
             "                      ,\"  ,/\"::::::\\          >\"                 (_-\"/:::::: "
             "                     /  ,\"_!:::::::/,       ,\"              _,,--,  /::::::/ "
             "                   /   \"\" _,\"\\:::::::'     !              ,\"      ){:::::/ "
             "                  !    _,\"    \\ \"\",         \\,\"\"\"-,____,\"__,,,\"_,\" _/ "
             "                   \"\"t\"       \\\\   \\          \"-,_(*)&&&&(*),\" \\ .\" "
             "                    /          \\\",  !            ,   \\   ! -    ) "
             "                    !          \\  \"\"             !    !==!\"-,__,' "
             "                    !           \\                 \"\"\"_\"\"\"\"`, \", /\"_ "
             "                    \\       ,   .l                 /\" \"     \", \\! ,_/ "
             "                     ),     \\   / \\                \\/       ,, /! ! "
             "                   ,::\\      \\,\"   \\                !        \\/ ! ! "
             "               _,::::\" )     )\\  ,\"  ___            \\ -,_,  ,\"\",! ! "
             "        __,,,::::\"\"   ,\"   ,\":::,-:::--:\"           __\\_!__/_\"\"-,_! "
             "  ,,:::\"\"\"\"\"\"\"      ,:_,\"\"__...._\"\"\"::::\"\"       /:::::\" \"\":::::: "
             " (:._              l::::::::::::\\\\/               \"\"          \"\" "
             "   \"\"\"\"--,,,---              \"\"\"\" "
             ""
             "I think so Brain..."))
     (point))
   'face 'doom-dashboard-banner))

(setq +doom-dashboard-ascii-banner-fn #'what-we-do-every-night-pinky)


;; spc spc for M-x
(map! :leader :n "SPC" #'execute-extended-command)


;; latex
(after! latex
  (setq TeX-parse-self t) ; Enable parse on load.
  (setq TeX-auto-save t) ; Enable parse on save.

  (add-hook 'pdf-view-mode-hook
            (lambda ()
              (display-line-numbers-mode -1)))

  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq company-idle-delay 0.8)
              ))

  (setq preview-image-type 'dvipng)

  (setq LaTeX-electric-left-right-brace t)
  (add-hook 'LaTeX-mode-hook #'turn-off-smartparens-mode)


  ;; Use pdf-tools to open PDF files
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-source-correlate-start-server t)

  ;; Update PDF buffers after successful LaTeX runs
  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer)

  (defvar latex-enable-auto-fill t
    "Whether to use auto-fill-mode or not in tex files.")

  (defvar latex-nofill-env '("equation"
                             "equation*"
                             "align"
                             "align*"
                             "tabular"
                             "tikzpicture")
    "List of environment names in which `auto-fill-mode' will be inhibited.")

  ;; pretiefy mode
  (setq prettify-symbols-unprettify-at-point 'right-edge)
  )



(after! flyspell
  (define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-wrapper)
  ;; (add-hook 'flyspell-mode-hook #'flyspell-correct-auto-mode)
  (after! flyspell
    (setq flyspell-lazy-idle-seconds 2))
  )


(after! flycheck
  (setq flycheck-check-syntax-automatically '(mode-enabled new-line))
  (setq flycheck-flake8rc "~/.config/flake8")

  (add-hook 'lsp-after-initialize-hook
            (lambda ()
              (flycheck-add-next-checker 'lsp '(warning . python-flake8))))
  )


(after! lsp-mode
  (eval-after-load "python"
    '(define-key python-mode-map (kbd "C-c C-c")
       (lambda () (interactive) (python-shell-send-buffer t) (python-shell-switch-to-shell))))

  (require 'dap-lldb)

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

  ;; lsp
  (setq lsp-ui-doc-delay 2)
  )


;; Preview buffer after split
(setq evil-vsplit-window-right t
      evil-split-window-below t)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (ibuffer))

(setq +ivy-buffer-preview t)

(after! ivy-posframe
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
  (ivy-posframe-mode 1)
  ;; (setq ivy-posframe-parameters
  ;;       '((left-fringe . 8)
  ;;         (right-fringe . 8)))
  )


;; Company mode
(after! company
  (setq company-idle-delay 0.8
        company-minimum-prefix-length 3)
  (setq company-show-numbers t)
  ;; (add-hook 'evil-normal-state-entry-hook #'company-abort)
  ) ;; make aborting less annoying.


(after! elcord
  ;; Discord integration
  (elcord-mode)
  (setq elcord-use-major-mode-as-main-icon t)
  )


;; ess
(set-company-backend! 'ess-r-mode '(company-R-args company-R-objects company-dabbrev-code :separate))

;; matlab-mode
(after! matlab-mode
  (add-to-list 'auto-mode-alist '("\\.m\\'" . matlab-mode))
  (setq matlab-indent-function-body t)
  (matlab-cedet-setup)

  (map!
   :after matlab-mode
   :map evil-normal-state-local-map
   "C-<return>" nil

   :map matlab-mode-map
   :n "C-<return>" #'matlab-shell-run-region-or-line

   :after matlab-mode
   :map matlab-shell-mode-map
   "C-tab" nil)
  )


;; expand region
(map! :nv "C-SPC" nil
      :nv "C-SPC" #'er/expand-region
      :nv "C-S-SPC" #'er/contract-region)


;; window managment
(map! "M-<tab>" (lambda ()
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


(after! evil
  ;; change inside quotes
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
  (define-key evil-outer-text-objects-map "q" 'my-evil-textobj-anyblock-a-quote)

  (map! "<backtab>" 'up-list)
  )


;; multicursor ignored commands
(after! evil-mc
  (add-to-list
   'evil-mc-custom-known-commands
   '(ess-smart-comma . ((:default . evil-mc-execute-default-call)))))

;; define function to shutdown emacs server instance
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs)
  )

;; smartparens
(after! smartparens
  (sp-local-pair 'org-mode "\\[" "\\]" :trigger "\\[")

  ;; disable '' auto pairing in electric-pair-mode for matlab-mode (' is transpose operator)
  (sp-local-pair 'matlab-mode "'" nil :actions nil)
  )



;; org

(use-package! org-super-agenda
  :commands (org-super-agenda-mode))



(after! org
  (setq org-src-window-setup 'split-window-below)
  (setq org-latex-create-formula-image-program 'dvipng)

  ;; fix color handling in org-preview-latex-fragment
  (let ((dvipng--plist (alist-get 'dvipng org-preview-latex-process-alist)))
    (plist-put dvipng--plist :use-xcolor t)
    (plist-put dvipng--plist :image-converter '("dvipng -D %D -T tight -o %O %f")))

  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
  ;; (setq org-format-latex-options (plist-put org-format-latex-options :background 'auto))

  (defun my/org-agenda-list-exclude-tags-advice (orig-fn &rest args)
    "Exclude selected tags from `org-agenda-list'.
Intended as :around advice for `org-agenda-list'."
    (let ((org-agenda-tag-filter-preset '("-Timesheet")))
      (apply orig-fn args)))

  (advice-add #'org-agenda-list :around #'my/org-agenda-list-exclude-tags-advice)


  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)


  )
; https://tecosaur.github.io/emacs-config/config.html#pretty-code-blocks

(use-package! engrave-faces-latex
  :after ox-latex)

(defvar org-latex-universal-preamble "
\\usepackage[main,include]{embedall}
\\IfFileExists{./\\jobname.org}{\\embedfile[desc=The original file]{\\jobname.org}}{}


"
  "Preamble to be included in every export.")

(defvar org-latex-conditional-preambles
  `((t . org-latex-universal-preamble)
    ("\\[\\[file:.*\\.svg\\]\\]" . "\\usepackage{svg}"))
  "Snippets which are conditionally included in the preamble of a LaTeX export.

Alist where when the car results in a non-nil value, the cdr is inserted in
the preamble.  The car may be a:
- string, which is used as a regex search in the buffer
- symbol, the value of which used
- function, the result of the function is used

The cdr may be a:
- string, which is inserted without processing
- symbol, the value of which is inserted
- function, the result of which is inserted")

(defadvice! org-latex-header-smart-preamble (orig-fn tpl def-pkg pkg snippets-p &optional extra)
  "Dynamically insert preamble content based on `org-latex-conditional-preambles'."
  :around #'org-splice-latex-header
  (let ((header (funcall orig-fn tpl def-pkg pkg snippets-p extra)))
    (if snippets-p header
      (concat header
              (mapconcat (lambda (term-preamble)
                           (when (pcase (car term-preamble)
                                   ((pred stringp) (save-excursion
                                                       (goto-char (point-min))
                                                       (search-forward-regexp (car term-preamble) nil t)))
                                   ((pred functionp) (funcall (car term-preamble)))
                                   ((pred symbolp) (symbol-value (car term-preamble)))
                                   (_ (user-error "org-latex-conditional-preambles key %s unable to be used" (car term-preamble))))
                             (pcase (cdr term-preamble)
                               ((pred stringp) (cdr term-preamble))
                               ((pred functionp) (funcall (cdr term-preamble)))
                               ((pred symbolp) (symbol-value (cdr term-preamble)))
                               (_ (user-error "org-latex-conditional-preambles value %s unable to be used" (cdr term-preamble))))))
                         org-latex-conditional-preambles
                         "\n")))))

 (setq org-latex-listings 'engraved) ; NOTE non-standard value

 (defadvice! org-latex-src-block-engraved (orig-fn src-block contents info)
   "Like `org-latex-src-block', but supporting an engraved backend"
   :around #'org-latex-src-block
   (if (eq 'engraved (plist-get info :latex-listings))
       (org-latex-scr-block--engraved src-block contents info)
     (funcall orig-fn src-block contents info)))

 (defadvice! org-latex-inline-src-block-engraved (orig-fn inline-src-block contents info)
   "Like `org-latex-inline-src-block', but supporting an engraved backend"
   :around #'org-latex-inline-src-block
   (if (eq 'engraved (plist-get info :latex-listings))
       (org-latex-inline-scr-block--engraved inline-src-block contents info)
     (funcall orig-fn src-block contents info)))

 (setq org-latex-engraved-code-preamble "
\\usepackage{fvextra}
\\fvset{
  commandchars=\\\\\\{\\},
  highlightcolor=white!95!black!80!blue,
  breaklines=true,
  breaksymbol=\\color{white!60!black}\\tiny\\ensuremath{\\hookrightarrow},
}
\\renewcommand\\theFancyVerbLine{\\footnotesize\\color{black!40!white}\\arabic{FancyVerbLine}}

\\usepackage[many]{tcolorbox}
\\DeclareTColorBox[]{Code}{}%
{enhanced,
  colback=white!97!black,
  colframe=white!94!black, boxrule=0.5pt,
  fontupper=\\color{EFD}\\footnotesize,
  arc=2.5pt, outer arc=2.5pt,
  boxsep=2pt, left=2pt, right=2pt, top=1pt, bottom=0.5pt,
  breakable}
")

 (add-to-list 'org-latex-conditional-preambles '("#\\+BEGIN_SRC\\|#\\+begin_src" . org-latex-engraved-code-preamble) t)
 (add-to-list 'org-latex-conditional-preambles '("#\\+BEGIN_SRC\\|#\\+begin_src" . engrave-faces-latex-gen-preamble) t)

 (defun org-latex-scr-block--engraved (src-block contents info)
   (let* ((lang (org-element-property :language src-block))
          (attributes (org-export-read-attribute :attr_latex src-block))
          (float (plist-get attributes :float))
          (num-start (org-export-get-loc src-block info))
          (retain-labels (org-element-property :retain-labels src-block))
          (caption (org-element-property :caption src-block))
          (caption-above-p (org-latex--caption-above-p src-block info))
          (caption-str (org-latex--caption/label-string src-block info))
          (placement (or (org-unbracket-string "[" "]" (plist-get attributes :placement))
                         (plist-get info :latex-default-figure-position)))
          (float-env
           (cond
            ((string= "multicolumn" float)
             (format "\\begin{listing*}[%s]\n%s%%s\n%s\\end{listing*}"
                     placement
                     (if caption-above-p caption-str "")
                     (if caption-above-p "" caption-str)))
            (caption
             (format "\\begin{listing}[%s]\n%s%%s\n%s\\end{listing}"
                     placement
                     (if caption-above-p caption-str "")
                     (if caption-above-p "" caption-str)))
            ((string= "t" float)
             (concat (format "\\begin{listing}[%s]\n"
                             placement)
                     "%s\n\\end{listing}"))
            (t "%s")))
          (options (plist-get info :latex-minted-options))
          (content-buffer
           (with-temp-buffer
             (insert
              (let* ((code-info (org-export-unravel-code src-block))
                     (max-width
                      (apply 'max
                             (mapcar 'length
                                     (org-split-string (car code-info)
                                                       "\n")))))
                (org-export-format-code
                 (car code-info)
                 (lambda (loc _num ref)
                   (concat
                    loc
                    (when ref
                      ;; Ensure references are flushed to the right,
                      ;; separated with 6 spaces from the widest line
                      ;; of code.
                      (concat (make-string (+ (- max-width (length loc)) 6)
                                           ?\s)
                              (format "(%s)" ref)))))
                 nil (and retain-labels (cdr code-info)))))
             (funcall (org-src-get-lang-mode lang))
             (engrave-faces-latex-buffer)))
          (content
           (with-current-buffer content-buffer
             (buffer-string)))
          (body
           (format
            "\\begin{Code}\n\\begin{Verbatim}[%s]\n%s\\end{Verbatim}\n\\end{Code}"
            ;; Options.
            (concat
             (org-latex--make-option-string
              (if (or (not num-start) (assoc "linenos" options))
                  options
                (append
                 `(("linenos")
                   ("firstnumber" ,(number-to-string (1+ num-start))))
                 options)))
             (let ((local-options (plist-get attributes :options)))
               (and local-options (concat "," local-options))))
            content)))
     (kill-buffer content-buffer)
     ;; Return value.
     (format float-env body)))

 (defun org-latex-inline-scr-block--engraved (inline-src-block _contents info)
   (let ((options (org-latex--make-option-string
                   (plist-get info :latex-minted-options)))
         code-buffer code)
     (setq code-buffer
           (with-temp-buffer
             (insert (org-element-property :value inline-src-block))
             (funcall (org-src-get-lang-mode
                       (org-element-property :language inline-src-block)))
             (engrave-faces-latex-buffer)))
     (setq code (with-current-buffer code-buffer
                  (buffer-string)))
     (kill-buffer code-buffer)
     (format "\\Verb%s{%s}"
             (if (string= options "") ""
               (format "[%s]" options))
             code)))


(defun sync-with-dropbox ()
  "Sync folders with Dropbox"
  (interactive)
  (call-process-shell-command "/usr/local/bin/rclonesync /home/jake/org/ Dropbox:org --check-access --filters-file ~/.rclonesyncwd/Filters" nil nil nil))
