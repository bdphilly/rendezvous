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
		:large => '400x400', 
		:medium => "200x200>", 
		:small => "100x100>" }, :default_url => 'https://s3.amazonaws.com/gorendezvous/missing.GIF'

	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	def avatar_url
		avatar.url(:medium)
	end

end