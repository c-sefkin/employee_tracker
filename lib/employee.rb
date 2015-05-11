class Employee < ActiveRecord::Base
  has_many(:divisions)
end
