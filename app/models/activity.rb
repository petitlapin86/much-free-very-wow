class Activity < ActiveRecord::Base

  belongs_to :user

  def slug
    self.title.parameterize
  end

  def self.find_by_slug(slug)
    self.all.find {|instance| instance.slug == slug}
  end

  def self.all_categories
    self.all.map do |activity|
      activity.category
    end.uniq
  end

end
