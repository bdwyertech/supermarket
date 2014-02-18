require 'spec_helper'

describe Curry::Repository do
  context 'validations' do
    it { should validate_presence_of(:owner) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:callback_url) }
  end

  it "deletes the repository's pull requests when destroyed" do
    repository = create(:repository)
    pull_request = create(:pull_request, repository: repository)

    expect do
      repository.destroy
    end.to change(Curry::PullRequest, :count).by(-1)
  end
end
