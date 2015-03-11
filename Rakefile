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

    task :xhtml => [:environment, 'build:html'] do
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

          ordered do
            chapters.each do |chapter|
              file "chapters/#{chapter.slug}.xhtml"
              heading chapter.title
            end
          end
        }
      end
      epubname = File.join(File.dirname(__FILE__), 'build', 'example_test_with_builder.epub')
      builder.generate_epub(epubname)
    end

    task :mobi => :epub do
      Kindlegen.run('build/BuildYourOwnSinatra.epub', '-o', 'build/BuildYourOwnSinatra.mobi')
      Kindlegen.run('build/BuildYourOwnSinatra-with-bonus.epub', '-o', 'build/BuildYourOwnSinatra-with-bonus.mobi')
    end

    task :pdf => :html do
      kit = PDFKit.new(File.new('build/html/pdf.html'))
      kit.to_file('build/BuildYourOwnSinatra.pdf')

      kit = PDFKit.new(File.new('build/html/pdf-with-bonus.html'))
      kit.to_file('build/BuildYourOwnSinatra-with-bonus.pdf')
    end
  end
end
