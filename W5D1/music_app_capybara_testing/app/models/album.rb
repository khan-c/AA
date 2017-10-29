# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  title      :string           not null
#  year       :integer          not null
#  live       :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :band_id, :title, :year, presence: true
  validates :live, inclusion: { in: [true, false] }
  

  belongs_to :band
end
