module AriaApi
  class Service
    class << self
      def actions
        @actions ||= client.operations
      end

      private

      def client
        if AriaApi::Configuration.wsdl_path
          local_client
        else
          remote_client
        end
      end

      def local_client
        Savon.client(wsdl: File.open(AriaApi::Configuration.wsdl_path))
      end

      def remote_client
        api_version = AriaApi::Configuration.api_version
        url = "https://secure.future.stage.ariasystems.net/api/Advanced/wsdl/#{api_version}/complete-doc_literal_wrapped.wsdl"
        Savon.client(wsdl: url)
      end
    end
  end
end
