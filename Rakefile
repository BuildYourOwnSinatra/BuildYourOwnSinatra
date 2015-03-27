namespace :assets do
  task :precompile do
    sh "middleman build"
  end
end

unless ENV['RACK_ENV'] == 'production'
  require 'fileutils'
  require 'middleman-blog'
  require 'gepub'
  require 'pdfkit'
  require_relative 'lib/tidy'

  task :environment do
    @app = ::Middleman::Application.server.inst
  end

  namespace :build do
    task :html do
      sh 'bundle exec middleman build'
    end

    task :xhtml => [:environment] do
      sh 'EPUB=true bundle exec middleman build'

      dir = File.join(File.dirname(__FILE__),  'build', 'html', 'chapters')
      @app.blog.articles.each do |chapter|
        content = chapter.render(layout: :epub)
        file = File.join(dir, "#{chapter.slug}.xhtml")
        File.open(file, 'w') { |file| file.write(content) }
      end
    end

    task :epub => [:environment, 'build:xhtml'] do
      data = @app.data
      chapters = @app.blog.articles.reverse.select { |chapter| !(chapter.data.published == false) }

      builder = GEPUB::Builder.new do
        language 'en'
        unique_identifier data.book.url, 'BookID', 'URL'
        title data.book.title
        creator 'K-2052'

        date Time.now

        resources(:workdir => File.join(File.dirname(__FILE__), 'build', 'html')) {
          cover_image 'Images/cover.jpg' => 'images/cover.jpg'
          files 'Styles/styles.css' => 'css/styles.css'
          glob 'images/*.svg'

          ordered do
            chapters.each do |chapter|
              file "chapters/#{chapter.slug}.xhtml"
              heading chapter.title
            end
          end
        }
      end
      epubname = File.join(File.dirname(__FILE__), 'build', 'BuildYourOwnSinatra.epub')
      builder.generate_epub(epubname)
    end

    task :mobi => :epub do
      sh 'kindlegen build/BuildYourOwnSinatra.epub -o BuildYourOwnSinatra.mobi'
    end

    task :pdf => :html do
      kit = PDFKit.new(File.new('build/html/pdf.html'))
      kit.to_file('build/BuildYourOwnSinatra.pdf')
    end
  end
end
