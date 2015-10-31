require 'parser/current'

module Pseudon
  TEMPLATES = {
    begin:        '(do %{0})',
    assign:       '(= %{0} %{1})',
    lvar:         '%{0}',
    int:          '%{0}'
  }
end
