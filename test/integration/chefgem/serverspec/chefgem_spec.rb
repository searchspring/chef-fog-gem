require 'spec_helper'

describe package('libxml2')  do
	it { should be_installed }
end

case os[:family]
when 'redhat'
	describe package('libxml2-devel') do
		it { should be_installed }
	end
when 'ubuntu'
	describe package('libxml2-dev') do
		it { should be_installed}
	end
end

describe command('/opt/chef/embedded/bin/gem list') do
	its(:stdout) { should match /nokogiri/ }
	its(:stdout) { should match /fog/ }
end