require_relative '../spec_helper'

describe 'fog_gem::default' do
  before do
  end
  platforms = {
    'centos-6.5' => {
      :plaform_family => 'rhel',
    },
    'amazon' => {
      :plaform_family => 'rhel',
    },
    'ubuntu-12.04' => {
      :plaform_family => 'debian',
    }
  }
  platforms.each do |platform,data|
    (os,version) = platform.split('-')
    context "On #{os} #{version}" do
      let(:chef_run) do
        runner = ChefSpec::SoloRunner.new
        runner.node.set[:platform] = os
        runner.node.set[:version] = version
        runner.node.set[:plaform_family] = data[:plaform_family]
        runner.converge(described_recipe) 
      end
      it "should include_recipe nokogiri::chefgem" do
        expect(chef_run).to include_recipe "nokogiri"
      end
      it "should gem_package install fog" do
        expect(chef_run).to install_gem_package 'fog'
      end
    end
  end
end
