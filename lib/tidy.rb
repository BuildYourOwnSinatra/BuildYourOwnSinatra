require 'tempfile'

def tidy(html)
  input = Tempfile.new('tidy_xhtml_converstion')
  input.write(html)
  input.close

  `tidy -asxhtml #{input.path} 2>&1`

  unless $?.exitstatus == 2
    html = IO.read(input.path)
  else
    html = nil
  end

  input.delete
  html
end
