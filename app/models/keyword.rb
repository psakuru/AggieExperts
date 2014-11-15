class Keyword < ActiveRecord::Base
    attr_accessible :key
    def self.get_match(term)
        @row = Keyword.where("keywords.key LIKE ?", '%'+ term +'%').first
    end
    
    def self.get_for_user(user_id)
      keywords = self.joins('JOIN pkeywords ON pkeywords.keyword_id = keywords.id').
                       where('pkeywords.user_id = ?', user_id).all
      return keywords
    end

    def self.get_for_user_as_string(id)
      keys = self.get_for_user(id).map{ |k| k.key}
      keywords = keys[0]
      for i in 1..(keys.size() - 1)
        keywords = keywords + ', ' + keys[i]
      end
      return keywords
    end
end
