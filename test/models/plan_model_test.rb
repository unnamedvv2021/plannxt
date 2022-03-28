require "test_helper"

class PlanModelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "test add a new item" do
    plan = PlanModel.new(name: "insert test1", data: "I am test!")
    plan.save
    id3_item = PlanModel.find(3)
    assert id3_item["name"]=="insert test1"
  end

  test "check data plan1 with id 1" do
    id1_item = PlanModel.find(1)
    assert id1_item["name"]=="plan1"
    assert id1_item["data"]=="sajksasdhjsadg"
  end
  
end
