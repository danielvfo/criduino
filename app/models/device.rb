class Device < ActiveRecord::Base
  belongs_to :user

  validates_format_of :mac, :with => /\A([0-9a-fA-F]{2}[:-]){5}[0-9a-fA-F]{2}\z/i
end
