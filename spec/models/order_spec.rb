require 'rails_helper'

describe Order do
  it { should validate_presence_of :amount }
end