module PictureTag
  module Instructions
    # PictureTag configuration
    class Config < Instruction
      def source
        PictureTag::Parsers::Configuration.new
      end
    end

    # Tag parameters
    class Params < Instruction
      def source
        PictureTag::Parsers::TagParser.new PictureTag.raw_params
      end
    end

    # Currently selected preset
    class Preset < Instruction
      def source
        PictureTag::Parsers::Preset.new PictureTag.params.preset_name
      end
    end

    # Handles non-image arguments to liquid tag and preset.
    class HtmlAttributes < Instruction
      def source
        PictureTag::Parsers::HTMLAttributeSet.new PictureTag.params.leftovers
      end
    end

    # TODO: rename to MediaQueries
    # Returns user-defined media queries.
    class MediaPresets < Instruction
      def source
        PictureTag.site.data.dig('picture', 'media_queries') || {}
      end
    end
  end
end
