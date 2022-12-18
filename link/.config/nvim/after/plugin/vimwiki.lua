
vim.cmd([[
  let wiki = {}
  let wiki.path = '~/Dropbox/vimwiki/'
  let wiki.path_html = '~/wiki_html/'
  let wiki.auto_export = 1
  let wiki.nested_syntaxes = {'python': 'python'}
  let wiki.template_path = '~/wiki_html/templates'
  let wiki.css_name = '~/wiki_html/templates/style.css'
  let g:vimwiki_list = [wiki]
  let g:vimwiki_folding = 'expr'
  let g:vimwiki_key_mappings = {'headers': 0}
]])
