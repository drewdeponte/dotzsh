#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# Emits Git metadata for use in a Zsh prompt.
#
# AUTHOR:
#    Ben Hoskings
#   https://github.com/benhoskings/dot-files/blob/master/files/bin/git_cwd_info
#
# MODIFIED:
#    Geoffrey Grosenbach http://peepcode.com

# The methods that get called more than once are memoized.

reset_all_attributes="%{\e[0m%}"
dirty_bit_color="%{\e[35m%}"
head_id_color="%{\e[34m%}"
branch_color="%{\e[35m%}"
rebasing_color="%{\e[35m%}"

def git_repo_path
  @git_repo_path ||= `git rev-parse --git-dir 2>/dev/null`.strip
end

def in_git_repo
  !git_repo_path.empty? &&
  git_repo_path != '~' &&
  git_repo_path != "#{ENV['HOME']}/.git"
end

def git_parse_branch
  @git_parse_branch ||= `~/.zsh/bin/git-current-branch`.chomp
end

def git_head_commit_id
  `git rev-parse --short HEAD 2>/dev/null`.strip
end

def git_cwd_dirty
  " ✗" unless git_repo_path == '.' || `git ls-files -m`.strip.empty?
end

def rebasing_etc
  if File.exists?(File.join(git_repo_path, 'BISECT_LOG'))
    "+bisect"
  elsif File.exists?(File.join(git_repo_path, 'MERGE_HEAD'))
    "+merge"
  elsif %w[rebase rebase-apply rebase-merge ../.dotest].any? {|d| File.exists?(File.join(git_repo_path, d)) }
    "+rebase"
  end
end

if in_git_repo
  print " #{branch_color}#{git_parse_branch} #{head_id_color}#{git_head_commit_id}#{rebasing_color}#{rebasing_etc}#{dirty_bit_color}#{git_cwd_dirty}#{reset_all_attributes}"
end
