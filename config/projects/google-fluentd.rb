require 'erb'
require 'fileutils'
require 'rubygems'

name "google-fluentd"
maintainer "Google, Inc."
homepage "http://cloud.google.com/logging/docs/"
description "Google Fluentd: A data collector for Google Cloud Logging"

install_dir     "/opt/google-fluentd"
build_version   "1.3.0"
build_iteration 1

# creates required build directories
dependency "preparation"

override :zlib, :version => '1.2.8'
override :rubygems, :version => '2.2.1'
# CentOS7 needs latest liblzma to build pg and some gems
if ohai['platform_family'] == 'rhel' && ohai['platform_version'].split('.').first.to_i == 7
  override :liblzma, :version => '5.1.2alpha'
end

# td-agent dependencies/components
dependency "td-agent"
dependency "td-agent-files"
dependency "td"
dependency "td-agent-ui"

# version manifest file
dependency "version-manifest"

exclude "\.git*"
exclude "bundler\/git"

compress :dmg do
end
