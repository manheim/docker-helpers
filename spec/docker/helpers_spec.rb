require 'spec_helper'

describe Docker::Helpers do
  it 'has a version number' do
    expect(Docker::Helpers::VERSION).not_to be nil
  end

  describe "#output_stream" do
    def harness body
      yield body if block_given?
    end

    describe "DEBUG undefined" do
      it "valid stream data" do
        body = '{"stream": "log me" }'
        output_stream = Docker::Helpers.output_stream

        expect{ harness(body, &output_stream) }.to_not output.to_stdout
      end

      it "invalid stream data" do
        body = '{"stream": "log me" }'
        output_stream = Docker::Helpers.output_stream

        expect{ harness(body, &output_stream) }.to_not output.to_stdout
      end
    end

    describe "DEBUG defined" do
      it "valid stream data" do
        allow(ENV).to receive(:[]).with("DEBUG").and_return('true')

        output_stream = Docker::Helpers.output_stream
        body          = '{"stream": "log me" }'

        expect{ harness(body, &output_stream) }.to output("log me\n").to_stdout
      end

      it "invalid stream data" do
        body = '{"some_key": "log me" }'
          allow(ENV).to receive(:[]).with("DEBUG").and_return('true')
          output_stream = Docker::Helpers.output_stream

          expect{ harness(body, &output_stream) }.to_not output.to_stdout
      end
    end
  end
end
