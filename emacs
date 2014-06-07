;;; use alt/option as Meta
(setq mac-option-modifier 'meta)

;;; when windows are split vertically use continuation lines
(setq-default truncate-partial-width-windows nil)

;;; Line/column numbers in the modeline.
(line-number-mode t)
(column-number-mode t)

;;; Time in the modeline.
(display-time)

;;; Search highlighting.
(setq-default search-highlight t)

;;; Use only spaces when indenting or centering, no tabs.
(setq-default indent-tabs-mode nil)

;;; Kill to beginning of line
(fset 'backward-kill-line "\C-u0\C-k")
(global-unset-key "\M-k")
(global-set-key "\M-k" 'backward-kill-line)

;;; Regex query replace binding

;;; Use y or n confirmation
;(fset 'yes-or-no-p 'y-or-n-p)

;;; Switches from a horizontal split to a vertical split
(defun window-horizontal-to-vertical ()
  (interactive)
  (let ((one-buf (window-buffer (selected-window)))
        (buf-point (point)))
    (other-window 1)
    (delete-other-windows)
    (split-window-horizontally)
    (switch-to-buffer one-buf)
    (goto-char buf-point)))

;;; Switches from a vertical split to a horizontal split
(defun window-vertical-to-horizontal ()
  (interactive)
  (let ((one-buf (window-buffer (selected-window)))
        (buf-point (point)))
    (other-window 1)
    (delete-other-windows)
    (split-window-vertically)
    (switch-to-buffer one-buf)
    (goto-char buf-point)))