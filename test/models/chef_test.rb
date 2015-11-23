require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chef_name:'john', email:'john@example.com')
  end

  test 'chef should be valid' do
    assert @chef.valid?
  end

  test 'chef name should not be empty' do
    @chef.chef_name = ''
    assert_not @chef.valid?
  end

  test 'chef name should not be too short' do
    @chef.chef_name = 'aa'
    assert_not @chef.valid?
  end

  test 'chef name should not be too long' do
    @chef.chef_name = 'a' * 41
    assert_not @chef.valid?
  end

  test 'email should not be empty' do
    @chef.email = ''
    assert_not @chef.valid?
  end

  test 'email should be within bounds' do
    @chef.email = 'a' * 101 + '@example.com'
    assert_not @chef.valid?
  end

  test 'email should be unique' do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end

  test 'valid email address' do
    valid_emails = %w[user@eee.com R_TDD-ds@eee.hello.org user@example.com first.last@eem.co]
    valid_emails.each do |valid|
      @chef.email = valid
      assert @chef.valid?, '#{valid} should be valid'
    end
  end

  test 'invalid email address' do
    invalid_emails = %w[user@eeecom R_TDD-ds@eee user@example_.com first.last_at_eem.co]
    invalid_emails.each do |invalid|
      @chef.email = invalid
      assert_not @chef.valid?, "#{invalid} should not be valid"
    end
  end
end
