module Shifter
  module AppleMusic
    def self.new(user:)
      AppleMusic.new(user: user)
    end

    class AppleMusic
      def initialize(user:)
        @user = user

        authenticate
      end

      private

      def authenticate
        # TODO: authenticate with Apple Music API
      end
    end
  end
end
