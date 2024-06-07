;extends

((comment) @code_cell.boundary
  (#eq? @code_cell.boundary "# %%"))

((_)+ @code_cell.content
    (#not-eq? @code_cell.content "# %%"))

;; ((comment) @code_cell.begin
;;   _+ @code_cell.content
;;   (comment) @code_cell.end
;;   (#not-eq? @code_cell.content "# %%")
;;   (#eq? @code_cell.begin "# %%")
;;   (#eq? @code_cell.end "# %%"))
