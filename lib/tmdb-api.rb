require 'httparty'
require 'json'

require 'tmdb-api/httparty'

require 'tmdb-api/base'
require 'tmdb-api/searchable'
require 'tmdb-api/inflections'

require 'tmdb-api/movie'
require 'tmdb-api/tv'
require 'tmdb-api/genre'
require 'tmdb-api/production_company'
require 'tmdb-api/production_country'
require 'tmdb-api/spoken_language'
require 'tmdb-api/changes'
require 'tmdb-api/person'
require 'tmdb-api/known_for'

require 'tmdb-api/version'

module TMDb
  class << self
    # Set the API Key that will be use to fetch the data or
    # retrieve it from the environment variable $TMDB_API_KEY.
    attr_writer :api_key

    def api_key
      @api_key || ENV['TMDB_API_KEY']
    end

    # Set the default language of the fetched data.
    attr_accessor :default_language
  end
end
