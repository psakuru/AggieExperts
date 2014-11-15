class Profile < ActiveRecord::Base
  has_many :pkeywords
  attr_accessible :user_id, :fname, :lname, :description, :phone, :email

  def self.get_profiles_by_keyword(term)
    @row = Keyword.get_match(term)
    @profiles = []
    
    if not @row.nil?
      @keyword_id = @row.id
      @profiles = self.joins('JOIN pkeywords ON profiles.user_id = pkeywords.user_id').
                       where('pkeywords.keyword_id = ?', @keyword_id).all || []
    end
    return @profiles
  end
end

