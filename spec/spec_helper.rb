require '../lib/interval'
require 'rspec/autorun'

describe TimeRange do
  let(:new) { TimeRange.new([['10:00', '10:20'], ['11:00', '12:00'],
                             ['12:20', '13:00'], ['10:20', '11:00'],
                             ['13:10', '13:20'], ['13:50', '14:00']], []) }

  let(:result_sort) { [["10:00", "10:20"], ["10:20", "11:00"], ["11:00", "12:00"],
                       ["12:20", "13:00"], ["13:10", "13:20"], ["13:50", "14:00"]] }

  let(:result_drop) { [['11:00', '12:00'],
                       ['12:20', '13:00'], ['10:20', '11:00'],
                       ['13:10', '13:20'], ['13:50', '14:00']] }

  let(:result_success) { [["10:20", "11:00"], ["12:00", "12:20"],
                          ["13:00", "13:10"], ["13:20", "13:50"]] }

  it 'creates a TimeRange class' do
    time = TimeRange.new([['13:50', '14:00']], [])
    expect(time).to be_kind_of(TimeRange)
  end

  it 'method_sort' do
    expect(new).to respond_to(:sort)
  end

  describe "sort" do
    context "when given sort correctly" do
      it 'sort correctly' do
        expect(new.sort).to eq result_sort
      end
    end
  end

  describe "drop" do
    context "when given the first element" do
      it 'return drop the first element for massive' do
        expect(new.drop_item).to eq result_drop
      end
    end
  end

  describe "range" do
    context "when given time range" do
      it 'return time range success' do
        expect(new.range).to eq result_success
      end
    end
  end

end
