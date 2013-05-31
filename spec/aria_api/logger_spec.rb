require 'spec_helper'

describe AriaApi::Logger do
  context "filtering" do

    let(:options) do
      { "auth_key" => "abcd123", "client_no" => "123456"}
    end

    let(:output) do
       StringIO.new
    end 

    let(:log_options) do
      {label: "Logging", value: options }
    end

    before do
      AriaApi::Configuration.logger = Logger.new(output)
    end

    it  "should filter auth_key when calling log" do
      AriaApi::Logger.log(log_options)
      output.string.include?("\"auth_key\":\"[FILTERED]\"").should be_true
    end

    it  "should filter client_no when calling log" do
      AriaApi::Logger.log(log_options)
      output.string.include?("\"client_no\":\"[FILTERED]\"").should be_true
    end

  end
end
