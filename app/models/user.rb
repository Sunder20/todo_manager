class User < ActiveRecord::Base
  def to_pleasant_string
    "#{id}. #{name}"
  end
end
