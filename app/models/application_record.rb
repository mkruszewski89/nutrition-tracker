class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def create_slug
    if self.class.where("name = ?", self.name).length > 1
      last_slug = self.class.where("name = ?", self.name)[-2].slug
      increment = last_slug[last_slug.rindex("-") + 1..last_slug.length].to_i + 1
      self.slug = "#{name.gsub(" ","-")}-#{increment}"
    else
      self.slug = "#{name.gsub(" ","-")}-1"
    end
    self.save
  end

end
