# -*- encoding: utf-8 -*-
# stub: money 6.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "money"
  s.version = "6.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Shane Emmons"]
  s.date = "2014-03-31"
  s.description = "A Ruby Library for dealing with money and currency conversion."
  s.email = ["shane@emmons.io"]
  s.homepage = "http://rubymoney.github.io/money"
  s.licenses = ["MIT"]
  s.post_install_message = "Please note the following API changes in Money version 6\n\n - Money#amount, Money#dollars methods now return instances of BigDecimal (rather than Float).\n\nPlease read the migration notes at https://github.com/RubyMoney/money#migration-notes\nand choose the migration that best suits your application.\n\nTest responsibly :-)\n"
  s.rubygems_version = "2.4.3"
  s.summary = "A Ruby Library for dealing with money and currency conversion."

  s.installed_by_version = "2.4.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<i18n>, ["~> 0.6.4"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14"])
      s.add_development_dependency(%q<yard>, ["~> 0.8"])
      s.add_development_dependency(%q<kramdown>, ["~> 1.1"])
    else
      s.add_dependency(%q<i18n>, ["~> 0.6.4"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.14"])
      s.add_dependency(%q<yard>, ["~> 0.8"])
      s.add_dependency(%q<kramdown>, ["~> 1.1"])
    end
  else
    s.add_dependency(%q<i18n>, ["~> 0.6.4"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.14"])
    s.add_dependency(%q<yard>, ["~> 0.8"])
    s.add_dependency(%q<kramdown>, ["~> 1.1"])
  end
end
