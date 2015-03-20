module S3Style
  class Url
    attr_reader :s3_url, :forced_extension

    def initialize(s3_url, forced_extension = nil)
      @s3_url = s3_url
      @forced_extension = forced_extension
    end

    def style(name)
      name = name.to_s

      if name.blank? || name == 'none'
        s3_url
      else
        inject_style(name)
      end
    end

    private

    def parsed_uri
      URI.parse(s3_url)
    end

    def inject_style(name)
      uri = parsed_uri
      extname = File.extname(uri.path)
      uri.path.sub!(/#{extname}\z/, "_#{name}#{extname}")
      force_extension(uri, extname)
      uri.to_s
    end

    def force_extension(uri, extname)
      if forced_extension
        uri.path.sub!(/#{extname}\z/, forced_extension)
      end
    end
  end
end
