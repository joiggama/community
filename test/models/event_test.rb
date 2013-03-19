require "minitest_helper"

describe Event do
  let(:event) { Event.new }
  let(:identity) { Identity.first }

  it "must be invalid without attributes" do
    event.valid?.must_equal false
    event.errors.size.must_equal 6
  end
  
  it "must be invalid when date is not in future" do
    event.tap do |e|
      e.name = 'Magmaconf'
      e.location = 'Manzanillo'
      e.contact = 'Crowdint'
      e.identity = identity
      e.date = Date.today    
    end

    event.valid?.must_equal false
    event.errors.size.must_equal 1
    event.errors[:date].wont_be_nil
  end

  it "must be valid" do
    event.tap do |e|
      e.name = 'MagmaConf'
      e.date = Date.today + 2
      e.location = 'Manzanillo'
      e.identity = identity
      e.contact = 'CrowdInt'
    end
    
    event.valid?.must_equal true
  end
end
