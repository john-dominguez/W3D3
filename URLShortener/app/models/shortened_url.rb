# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  def self.generate_short_url(long_url, user)
    s_url = ShortenedUrl.random_code
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: s_url)
  end

  def self.random_code
    s_url = SecureRandom::urlsafe_base64
    until ShortenedUrl.find_by(short_url: s_url).nil?
      s_url = SecureRandom::urlsafe_base64
    end
    s_url
  end

end
