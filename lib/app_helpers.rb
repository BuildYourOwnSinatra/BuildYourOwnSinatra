require 'mime/types'

module AppHelpers
  def send_file(local_file, status: 200, filename: nil, dir: 'public')
    dir = self.configuration.public_dir if self.configuration.public_dir
    lp = local_file[0] == File::SEPARATOR ? local_file : File.expand_path(File.join(dir, local_file))
    return Rack::Response.new '', 404 unless File.exist? lp

    response = Rack::Response.new [], status

    # Content-Type
    response['Content-Type'] = (MIME::Types.type_for(File.extname(lp))[0].content_type rescue 'plain/text')

    # Content-Length
    response['Content-Length'] = File.size(lp).to_s

    response.body << File.read(lp)
    response
  end
end
