class Ppublication < ActiveRecord::Base
  attr_accessible :user_id, :url, :title
  belongs_to :user
  validates :title, presence: true

  def self.update(params)
    error = ""
    self.where(:user_id => params[:id]).each do |pub|
      if ((params[:data][pub.id.to_s]).key?("check"))
        pub.destroy
      else
        pub.update_attributes!((params[:data][pub.id.to_s])['data'])
      end
      error = error + pub.errors.values.join(' + ')
    end

    if params[:data].key?("new")
      params[:data]['new'].each do |key, pub|
        self.create(:user_id => params[:id], :title => pub['data']['title'], :url => pub['data']['url'])
        error = error + self.errors.values.join(' + ')
      end
    end
  end
end
