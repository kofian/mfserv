# -*- encoding: utf-8 -*-
# stub: kitco 0.0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "kitco".freeze
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["mikeycgto".freeze]
  s.date = "2016-04-05"
  s.description = "An API for accessing data from Kitco Charts. Also includes a command line utility".freeze
  s.email = "mikeycgto@gmail.com".freeze
  s.executables = ["kitco".freeze]
  s.files = ["bin/kitco".freeze]
  s.homepage = "https://github.com/mikeycgto/kitco".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "An API for accessing data from Kitco Charts. Also includes a command line utility!".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>.freeze, ["~> 0.13"])
    else
      s.add_dependency(%q<httparty>.freeze, ["~> 0.13"])
    end
  else
    s.add_dependency(%q<httparty>.freeze, ["~> 0.13"])
  end
end
