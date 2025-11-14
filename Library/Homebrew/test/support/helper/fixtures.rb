# typed: true
# frozen_string_literal: true

module Test
  module Helper
    module Fixtures
      def dylib_path(name)
        Pathname.new("#{TEST_FIXTURE_DIR}/mach/#{name}.dylib")
                .extend(MachOShim)
      end

      def bundle_path(name)
        Pathname.new("#{TEST_FIXTURE_DIR}/mach/#{name}.bundle")
                .extend(MachOShim)
      end

      def cask_path(name)
        Pathname.new("#{TEST_FIXTURE_DIR}/cask/Casks/#{name}.rb")
      end
    end
  end
end
