# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  username    :string(255)
#  fname       :string(255)
#  description :text
#  uupc        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class User < ActiveRecord::Base

	has_attached_file :avatar, :styles => { 
		:large => '500x500', 
		:medium => "300x300>", 
		:small => "150x150>" }, :default_url => 'https://s3.amazonaws.com/gorendezvous/missing.GIF'

	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	def avatar_url_large
		avatar.url(:large)
	end

	def avatar_url_medium
		avatar.url(:medium)
	end

end