# typed: strict
# frozen_string_literal: true

module Utils
  sig {
    params(binary: T.any(String, Pathname), library: T.any(String, Pathname)).returns(T::Boolean)
  }
  def self.binary_linked_to_library?(binary, library)
    binary_path = Pathname.new(binary)

    if OS.mac?
      binary_path.extend(MachOShim)
    elsif OS.linux?
      binary_path.extend(ELFShim)
    end

    binary_path.dynamically_linked_libraries.any? do |dll|
      next false unless dll.start_with?(HOMEBREW_PREFIX.to_s)

      File.realpath(dll) == File.realpath(Pathname.new(library))
    end
  end
end
