require 'voom/presenters/dsl/components/base'
require 'voom/presenters/pluggable'

gem_dir = Gem::Specification.find_by_name('voom-presenters').gem_dir
mixins_dir = File.join(gem_dir, 'lib', 'voom', 'presenters', 'dsl', 'components', 'mixins')

Dir[File.join(mixins_dir, '*.rb')].each do |file|
  require File.join(mixins_dir, File.basename(file, File.extname(file)))
end

module Voom
  module Presenters
    module Plugins
      module Cacheable

        class Component < DSL::Components::Base
          DSL::Components::Mixins.constants(false).each do |mixin|
            const = DSL::Components::Mixins.const_get(mixin)
            include const if const.is_a?(Module)
          end

          extend Pluggable
          include_plugins(:DSLComponents)

          attr_reader :cache_key, :components

          def initialize(key_or_collection, **attrs, &block)
            super(type: :cacheable, **attrs, &block)

            @components = []
            @cache_key = build_cache_key(key_or_collection)

            expand!
          end

          private

          def build_cache_key(key)
            if key.respond_to?(:map)
              key.map { |k| build_cache_key(k) }.join('-')
            elsif key.respond_to?(:cache_key)
              key.cache_key
            else
              key.to_s
            end
          end

        end

      end
    end
  end
end
