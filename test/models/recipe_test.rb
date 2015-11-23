require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @chef = Chef.create(chef_name: 'bob', email: 'bob@exmple.com')
    @recipe = @chef.recipes.build(name: 'Example',
                         summary: 'some summary about our recipe',
                         description: 'another field called description that used to put some description about our recipe')

  end

  test 'chef id should be exist' do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test 'should be valid' do
    assert @recipe.valid?
  end

  test 'name should not be empty' do
    @recipe.name = ''
    assert_not @recipe.valid?
  end

  test 'name length should not be too short' do
    @recipe.name = 'aaaa'
    assert_not @recipe.valid?
  end

  test 'name length should not be too long' do
    @recipe.name = 'a' * 101
    assert_not @recipe.valid?
  end

  test 'summary should not be empty' do
    @recipe.summary = ''
    assert_not @recipe.valid?
  end

  test 'summary length should not be too short' do
    @recipe.summary = 'a' * 9
    assert_not @recipe.valid?
  end

  test 'summary length should not be too long' do
    @recipe.summary = 'a' * 151
    assert_not @recipe.valid?
  end

  test 'description should not be empty' do
    @recipe.description = ''
    assert_not @recipe.valid?
  end

  test 'description length should not be too short' do
    @recipe.description = 'a' * 49
    assert_not @recipe.valid?
  end

  test 'description length should not be too long' do
    @recipe.description = 'a' * 501
    assert_not @recipe.valid?
  end
end
