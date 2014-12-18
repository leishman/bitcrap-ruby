require 'rails_helper'

describe EmailAddress do

  it "should be valid" do
    expect(EmailAddress.new('a@a.com').valid?).to eq true
    expect(EmailAddress.new('1a@a.com').valid?).to eq true
    expect(EmailAddress.new('A.a@a.com').valid?).to eq true
    expect(EmailAddress.new('niceandsimple@example.com').valid?).to eq true
    expect(EmailAddress.new('a.little.unusual@example.com').valid?).to eq true
    expect(EmailAddress.new('23ahkjlMn@a.com').valid?).to eq true
    expect(EmailAddress.new('aL@cs.aMa.edu').valid?).to eq true
    expect(EmailAddress.new('b_a@sdf.sdlkja.com').valid?).to eq true
    expect(EmailAddress.new('a.little.more.unusual@dept.example.com').valid?).to eq true
    expect(EmailAddress.new('mMa@sldkjf.ASDF23a.com.tw').valid?).to eq true
  end

  it "should be invalid" do
    expect(EmailAddress.new('@').valid?).to eq false
    expect(EmailAddress.new('m').valid?).to eq false
    expect(EmailAddress.new('+').valid?).to eq false
    expect(EmailAddress.new('a@a@a.com').valid?).to eq false
    expect(EmailAddress.new('aa@a').valid?).to eq false
    expect(EmailAddress.new('@a.com').valid?).to eq false
    expect(EmailAddress.new('Abc.example.com').valid?).to eq false
    expect(EmailAddress.new('a a@a.com').valid?).to eq false
    expect(EmailAddress.new('@').valid?).to eq false
  end
end