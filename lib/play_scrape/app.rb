module PlayScrape
  class AppInfo
    attr_accessor :app_name, :package_name, :description, :rating, :num_ratings, :dev_url, :icon_url,
      :min_installs, :max_installs

    def initialize
    end

    def to_hash
      hash = Hash.new
      self.instance_variables.each { |var| hash[var.to_s.delete("@")] = self.instance_variable_get(var) }
    end

  end
end
