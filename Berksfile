source "https://supermarket.getchef.com"

metadata

cookbook 'build-essential'
cookbook 'ruby_install', '~> 1.0.4'
cookbook 'libxml2', '~> 0.1.1'
cookbook 'nokogiri', '~> 0.1.1'
cookbook 'yum'
cookbook 'apt'

group :integration do
  cookbook 'fake', path: 'test/fixtures/cookbooks/fake'
  cookbook 'python'
end