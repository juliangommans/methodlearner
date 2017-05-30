require './db/seeds/ruby/array.rb'

class RubyDocs
  attr_reader :base_url, :site, :language, :db_entries

  def initialize
    @base_url = "http://ruby-doc.org/core/"
    @site = "Ruby Docs"
    @language = "Ruby"
    @db_entries = 0
  end

  def self.seed_docs
    new().seed_docs
  end

  def seed_docs
    puts "### Seeding Docs ###"
    array_methods
    puts "### #{db_entries} Database Entries Added ###"
    puts "### Seeding Complete ###"
  end

  def array_methods
    if LinksTable.find_by(method_type: "Arrays").nil?
      puts "### Seeding Ruby Arrays"
      obj = RubyArrayMethods
      obj.links.each do |link|
        seed_database(link, obj)
      end
    end
  end

  def seed_database(link, obj)
    params = build_params(link, obj)
    LinksTable.create!(params)
    db_entries += 1
  end

  def build_params(link, obj)
    {
      base_url: base_url,
      site: site,
      language: language,
      url_prefix: obj.prefix,
      url_suffix: link,
      method_type: obj.type
    }
  end
end
