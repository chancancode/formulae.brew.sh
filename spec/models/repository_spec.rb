# This code is free software; you can redistribute it and/or modify it under
# the terms of the new BSD License.
#
# Copyright (c) 2012-2017, Sebastian Staudt

require 'rails_helper'

describe Repository do

  let(:repo) { Repository.new name: Repository::CORE }
  let(:main_repo) { Repository.new name: Repository::MAIN }

  before do
    Repository.stubs(:find).with(Repository::CORE).returns repo
    Repository.stubs(:find).with(Repository::MAIN).returns main_repo
  end

  describe '.core' do
    it "returns the repository object for #{Repository::CORE}" do
      expect(Repository.core).to eq(repo)
    end
  end

  describe '.main' do
    it "returns the repository object for #{Repository::MAIN}" do
      expect(Repository.main).to eq(main_repo)
    end
  end

  describe '#core?' do
    it "returns true for #{Repository::CORE}" do
      expect(repo.core?).to be_truthy
    end

    it 'returns false for other repositories' do
      expect(Repository.new(name: 'Homebrew/homebrew-science').core?).to be_falsey
    end
  end

  describe '#to_param' do
    it 'returns the name of the repository' do
      expect(repo.to_param).to eq(Repository::CORE)
    end
  end

  describe '#url' do
    it 'returns the Git URL of the GitHub repository' do
      expect(repo.url).to eq("git://github.com/#{Repository::CORE}.git")
    end
  end

end
