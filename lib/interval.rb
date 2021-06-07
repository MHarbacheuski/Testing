class TimeRange

  attr_accessor :end_time

  def initialize(arr, arr2)
    @arr = arr
    @arr2 = arr2
    @end_time = end_time
  end

  def drop_item
    @arr = @arr.drop(1)
  end

  def sort
    @arr = @arr.sort { |a, b| a[0] <=> b[0] }
  end

  def range
    sort
    @end_time = @arr[0][1]
    drop_item
    for item in @arr do
      if (item[0] > @end_time)
        @arr2.push([@end_time, item[0]])
        if (item[1] > @end_time)
          @end_time = item[1]
        end
      end
    end
    return @arr2
  end
  end

  #arr = [['10:00', '10:20'],['11:00', '12:00'], ['11:10', '13:00']]
  arr = [['10:00', '10:20'] , ['11:00', '12:00'] ,['12:20', '13:00'] ,
         ['10:20', '11:00'], ['13:10', '13:20'], ['13:50', '14:00']]
  arr2 = []
end_time = ""

  time = TimeRange.new(arr,arr2)
  #print time.range

# arr = [['10:00', '10:20'] , ['11:00', '12:00'] ,['12:20', '13:00'] ,
#        ['10:20', '11:00'], ['13:10', '13:20'], ['13:50', '14:00']]
# arr2 =[]
# arr =  arr.sort {|a,b| a[0] <=> b[0]}
# end_time = arr[0][1]
# arr = arr.drop(1)
# # print arr
# # print start_time
# # print end_time
#
# for item in arr do
#   if(item[0] > end_time)
#     arr2.push([end_time, item[0]])
#     if(item[1] > end_time)
#       end_time = item[1]
#     end
#   end
#
# end
# print(arr2)