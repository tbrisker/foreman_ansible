# frozen_string_literal: true

require 'test_plugin_helper'

# Tests for the behavior of Ansible Role, currently only validations
class AnsibleRoleTest < ActiveSupport::TestCase
  should have_many(:host_ansible_roles)
  should have_many(:hosts).through(:host_ansible_roles).dependent(:destroy)
  should validate_presence_of(:name)
  context 'with new role' do
    subject { AnsibleRole.new(:name => 'foo') }
    should validate_uniqueness_of(:name)
  end

  test 'should cast default_value to hash' do
    variable = FactoryBot.create(
      :ansible_variable,
      :key_type => 'hash',
      :default_value => "{\r\n  \"bat\": \"man\"\r\n}\r\n",
      :override => true
    )
    assert variable.default_value.is_a?(Hash)
  end
end
