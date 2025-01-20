; https://github.com/EmranMR/tree-sitter-blade?tab=readme-ov-file#injections
((text) @injection.content
    (#not-has-ancestor? @injection.content "envoy")
    (#set! injection.combined) (#set! injection.language php))

((php_only) @injection.content
   (#set! injection.language php_only))

((parameter) @injection.content
   (#set! injection.language php_only))

((text) @injection.content
   (#has-ancestor? @injection.content "envoy")
   (#set! injection.combined)
   (#set! injection.language bash))

; tree-sitter-comment injection
; if available
((comment) @injection.content
 (#set! injection.language "comment"))



