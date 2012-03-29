# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "aria_billing/version"

Gem::Specification.new do |s|
  s.name        = "aria_billing"
  s.version     = AriaBilling::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Juan Pemberty"]
  s.email       = ["juan@pemberthy.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby Wrap for the aria subscriptions and billing system}
  s.description = %q{Ruby Wrap for the aria subscriptions and billing system}

  s.rubyforge_project = "aria_billing"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "httparty"
  s.add_dependency "json"
  s.add_dependency "savon"

  ["rake", "rspec", "vcr", "webmock"].each do |dev_dependency|
    s.add_dependency dev_dependency
  end
end
