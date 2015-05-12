class Employee < ActiveRecord::Base
  has_many(:divisions)
  has_many(:projects)
end
