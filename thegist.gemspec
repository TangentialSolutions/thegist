# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: thegist 1.0.0 ruby vendor lib app

Gem::Specification.new do |s|
  s.name = "thegist".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["vendor".freeze, "lib".freeze, "app".freeze]
  s.authors = ["tangentus".freeze]
  s.date = "2021-08-07"
  s.description = "Thegist".freeze
  s.email = "trevor.broaddus@hey.com".freeze
  s.executables = ["thegist".freeze]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown"
  ]
  s.files = [
    "LICENSE.txt",
    "VERSION",
    "app/thegist.rb",
    "app/thegist/launch.rb",
    "app/thegist/view/app_view.rb",
    "bin/thegist",
    "package/linux/Thegist.png",
    "package/macosx/Thegist.icns",
    "package/windows/Thegist.ico"
  ]
  s.homepage = "http://github.com/tangentus/thegist".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Thegist".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<glimmer-dsl-swt>.freeze, ["~> 4.20.13.15"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
      s.add_development_dependency(%q<juwelier>.freeze, ["= 2.4.9"])
      s.add_development_dependency(%q<warbler>.freeze, ["= 2.0.5"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    else
      s.add_dependency(%q<glimmer-dsl-swt>.freeze, ["~> 4.20.13.15"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
      s.add_dependency(%q<juwelier>.freeze, ["= 2.4.9"])
      s.add_dependency(%q<warbler>.freeze, ["= 2.0.5"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<glimmer-dsl-swt>.freeze, ["~> 4.20.13.15"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
    s.add_dependency(%q<juwelier>.freeze, ["= 2.4.9"])
    s.add_dependency(%q<warbler>.freeze, ["= 2.0.5"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end

