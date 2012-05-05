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
#
# MODIFIED:
#    Andrew De Ponte http://andrewdeponte.com

# The methods that get called more than once are memoized.

# All the shell color codes wrapped in ZSH literal escapes ${ %}. The literal
# tells zsh to not let them effect position as well as to treat them as escape
# sequences which they are.
$color_codes = {
  :black => "%{\e[30m%}",
  :red => "%{\e[31m%}",
  :green => "%{\e[32m%}",
  :yellow => "%{\e[33m%}",
  :blue => "%{\e[34m%}",
  :magenta => "%{\e[35m%}",
  :cyan => "%{\e[36m%}",
  :white => "%{\e[37m%}",
  :reset => "%{\e[0m%}"
}

$dirty_bit_color = $color_codes[:magenta]
$head_id_color = $color_codes[:blue]
$branch_color = $color_codes[:magenta]
$rebasing_color = $color_codes[:magenta]
$pomodoro_good_color = $color_codes[:green]
$pomodoro_bad_color = $color_codes[:red]
$pomodoro_approaching_color = $color_codes[:yellow]

def minutes_since_last_commit
  time_of_now_in_seconds = `date +%s`.to_i
  time_of_last_commit_in_seconds = `git log --pretty=format:'%at' -1`.to_i
  seconds_since_last_commit = time_of_now_in_seconds - time_of_last_commit_in_seconds
  minutes_since_last_commit = seconds_since_last_commit / 60
  return minutes_since_last_commit
end

def displayable_minutes_since_last_commit
  min_last_com = minutes_since_last_commit
  if min_last_com > 30
    color = $pomodoro_bad_color
  elsif min_last_com > 10
    color = $pomodoro_approaching_color
  else
    color = $pomodoro_good_color
  end
  return "#{color}#{minutes_since_last_commit}m"
end

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
  print " #{displayable_minutes_since_last_commit} #{$branch_color}#{git_parse_branch} #{$head_id_color}#{git_head_commit_id}#{$rebasing_color}#{rebasing_etc}#{$dirty_bit_color}#{git_cwd_dirty}#{$color_codes[:reset]}"
end
