#
# Copyright 2019- kaija
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "fluent/plugin/filter"


module Fluent
  module Plugin
    class UniformFilter < Fluent::Plugin::Filter
      Fluent::Plugin.register_filter("uniform", self)

      desc 'the field key should exist in output'
      config_param :maps, :array, default: nil
      desc 'lower the key'
      config_param :to_lower, :bool, default: true


      def configure(conf)
        super
        @maps = conf['maps'].map {|k| k.downcase}
        @to_lower = conf['to_lower']
      end

      def filter(tag, time, record)
        super
        out = {}
        record.each{ |key, value|
          if @maps.include? key.downcase
            if @to_lower
              out[key.downcase] = value
            else
              out[key] = value
            end
          end
        }
        out
      end
    end
  end
end
