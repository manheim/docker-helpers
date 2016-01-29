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

  describe "#get_image" do
    context "no image_id" do
      describe "no options supplied" do
        it "calls Docker::Image#build_from_dir with default options" do
          docker_image = class_double("Docker::Image").as_stubbed_const()

          expect(docker_image).to receive(:build_from_dir).with('.',{})
          Docker::Helpers.get_image()
        end
      end

      describe "build_dir supplied" do
        it "calls Docker::Image#build_from_dir with build_dir" do
          docker_image = class_double("Docker::Image").as_stubbed_const()
          opts = { build_dir: 'docker_files/' }

          expect(docker_image).to receive(:build_from_dir).with(opts[:build_dir], opts)
          Docker::Helpers.get_image(opts)
        end
      end
    end

    describe "image_id supplied" do
      it "calls Docker::Image#get with image_id" do
        docker_image = class_double("Docker::Image").as_stubbed_const()
        opts = { image_id: 'asdf1234' }

        expect(docker_image).to receive(:get).with(opts[:image_id])
        Docker::Helpers.get_image(opts)
      end
    end
  end
end
