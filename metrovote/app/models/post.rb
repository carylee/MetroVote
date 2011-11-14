require 'AlchemyAPI'

class Post < ActiveRecord::Base
  belongs_to :candidate
  default_scope :order => 'posted_at DESC'

  def bold_people
    @alchemy = AlchemyAPI.new
    @alchemy.setAPIKey( '7f276adf084fe106532aca9a8c347db01ebadf02')
    result = ActiveSupport::JSON.decode(@alchemy.TextGetRankedNamedEntities(self.message, AlchemyAPI::OutputMode::JSON))
    result['entities'].each do |entity|
      if entity['type'] == 'Person' or entity['type'] == 'Organization'
        unless entity['text'] == self.candidate.name
          self.message = self.message.gsub(/#{entity['text']}/, '<strong>\0</strong>')
        end
      end
    end
    save
  end

end
