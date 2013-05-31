module AriaApi
  class Logger
    class << self
      def log(opts={})
        return unless AriaApi::Configuration.logger.respond_to?(:info)
        label = opts.fetch(:label){ "" }
        value = opts.fetch(:value){ {} }
        value = self.filter(value)
        AriaApi::Configuration.logger.info("#{label}: #{value.to_json}")
      end

      def filter_keys
        ["auth_key", "client_no"]
      end

      def filters
        filter_keys.inject({}) do |result, key| 
          result[key] = "[FILTERED]"
          result
        end
      end

      def filter(value)
        value.merge(self.filters)
      end
    end
  end
end