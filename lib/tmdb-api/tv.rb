module TMDb
  class Tv < Base
    extend Searchable

    ATTRIBUTES = :id, :adult, :backdrop_path, :belongs_to_collection, :budget,
      :genres, :homepage, :imdb_id, :original_title, :overview, :popularity,
      :poster_path, :production_companies, :runtime, :production_countries,
      :release_date, :revenue, :spoken_languages, :status, :tagline, :title,
      :vote_average, :vote_count

    attr_reader *ATTRIBUTES

    def self.find(id, options = {})
      res = get("/tv/#{id}", query: options)
      res.success? ? Movie.new(res) : bad_response(res)
    end
    
    def self.alternative_titles(id, options = {})
      res = get("/tv/#{id}/alternative_titles", query: options)
      res.success? ? res['titles'] : bad_response(res)
    end
    
    def self.translations(id, options = {})
      res = get("/tv/#{id}/translations", query: options)
      res.success? ? res['translations'] : bad_response(res)
    end

    def self.cast(id, options = {})
      res = get("/tv/#{id}/credits", query: options)
      res.success? ? res['cast'] : bad_response(res)
    end

    def self.crew(id, options = {})
      res = get("/tv/#{id}/credits", query: options)
      res.success? ? res['crew'] : bad_response(res)
    end

    def self.images(id, options = {})
      res = get("/tv/#{id}/images", query: options)
      res.success? ? res : bad_response(res)
    end

    def self.keywords(id, options = {})
      res = get("/tv/#{id}/keywords", query: options)
      res.success? ? res['keywords'] : bad_response(res)
    end
    
    def self.videos(id, options = {})
      res = get("/tv/#{id}/videos", query: options)
      res.success? ? res : bad_response(res)
    end

    def self.releases(id)
      res = get("/tv/#{id}/releases")
      res.success? ? res['countries'] : bad_response(res)
    end

    def self.upcoming(options = {})
      res = get('/tv/upcoming', query: options)

      if res.success?
        res['results'].map { |movie| Movie.new(movie) }
      else
        bad_response(res)
      end
    end
  end
end
