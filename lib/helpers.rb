require 'github_api'

module Helpers
  def note(&block)
    note = Kramdown::Document.new(capture(&block), input: 'GFM', syntax_highlighter: 'rouge').to_html
    concat partial 'partials/note', locals: { note: note }
  end

  def tip(&block)
    tip = Kramdown::Document.new(capture(&block), input: 'GFM', syntax_highlighter: 'rouge').to_html
    concat partial 'partials/tip', locals: { tip: tip }
  end

  def warning(&block)
    warning = Kramdown::Document.new(capture(&block), input: 'GFM', syntax_highlighter: 'rouge').to_html
    concat partial 'partials/warning', locals: { warning: warning }
  end

  def commit(github_path, sha, message='Commit Link')
    user_and_repo = github_path.split('/')

    if user_and_repo.count == 2
      user, repo = user_and_repo
    else
      user, repo = ENV['GITHUB_USER'], github_path
    end

    github = Github.new

    begin
      commit  = github.repos.commits.get user, repo, sha
      message = truncate(commit.message, length: 60) if commit
    rescue
      # do nothing
    end

    url  = "https://github.com/#{user}/#{repo}/commit/#{sha}"
    partial 'partials/commit', locals: { message: message, sha: sha, repo: repo, url: url }
  end

  def gh_branch(github_path, branch, message = 'Checkout Current Step')
    user_and_repo = github_path.split('/')

    if user_and_repo.count == 2
      user, repo = user_and_repo
    else
      user, repo = ENV['GITHUB_USER'], github_path
    end

    url  = "https://github.com/#{user}/#{repo}/tree/#{branch}"
    partial 'partials/gh_branch', locals: { message: message, repo: repo, url: url, branch: branch }
  end

  def preview_chapters
    ENV['PREVIEW_CHAPTERS'] ||= 'introduction setting-up-a-development-environment rack designing-your-framework paterrns-with-your-framework'
    preview_chapters ||= ENV['PREVIEW_CHAPTERS'].split
  end
end
