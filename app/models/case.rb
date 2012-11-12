class Case < ActiveRecord::Base
  attr_accessible :name, :number

  has_many :documents, :dependent => :destroy
end
