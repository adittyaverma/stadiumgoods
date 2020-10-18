require 'rest-client'

class Social

	def self.execute
		result = {}
		facebook_data = Concurrent::Promise.execute do
		 	facebook
		end
		instagram_data = Concurrent::Promise.execute do
			instagram
		end
		twitter_data = Concurrent::Promise.execute do
			twitter
		end
		
		result[:facebook] = parse_facebook_json(facebook_data)
		result[:instagram] = parse_instagram_json(instagram_data)
		result[:twitter] = parse_twitter_json(twitter_data)

		return result
	end

	def self.facebook
		res = RestClient.get 'https://takehome.io/facebook', {accept: :json}
		res = JSON.parse(res.body)
	rescue RestClient::Exception => ex
	  Rails.logger.info "RestClient Error for Facebook: #{ex.message}"
	  res = nil
	end

	def self.twitter
		res = RestClient.get 'https://takehome.io/twitter', {accept: :json}
		res = JSON.parse(res.body)
	rescue RestClient::Exception => ex
	  Rails.logger.info "RestClient Error for Twitter: #{ex.message}"
	  res = nil
	end

	def self.instagram
		res = RestClient.get 'https://takehome.io/instagram', {accept: :json}
		res = JSON.parse(res.body)
	rescue RestClient::Exception => ex
	  Rails.logger.info "RestClient Error for Instagram: #{ex.message}"
	  res = nil
	end

	private

	def self.parse_facebook_json(facebook_data)
		data = facebook_data.value
		Rails.cache.write('facebook_cache', data) if data.present?
		Rails.cache.read('facebook_cache') || []
	end

	def self.parse_instagram_json(instagram_data)
		data = instagram_data.value
		Rails.cache.write('instagram_cache', data) if data.present?
		Rails.cache.read('instagram_cache') || []
	end

	def self.parse_twitter_json(twitter_data)
		data = twitter_data.value
		Rails.cache.write('twitter_cache', data) if data.present?
		Rails.cache.read('twitter_cache') || []
	end

end
