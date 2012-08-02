#!/usr/bin/env ruby

require 'wukong'
load '/home/dlaw/dev/wukong/examples/wikipedia/munging_utils.rb'

module PagesToTSV
  class Mapper < Wukong::Streamer::LineStreamer

    RECORD_COLUMNS=  [:int, :int, :string, :string, :int, 
                      :int, :int, :float, :string, :int, :int]
    RECORD_RE = MungingUtils.create_sql_regex(RECORD_COLUMNS)
   
    def process line
      MungingUtils.guard_encoding(line) do |clean_line|
        return unless clean_line =~ /INSERT INTO/
        clean_line.scan(RECORD_RE).each do |fields|
          RECORD_COLUMNS.each_with_index do |type,index|
            next unless type == :string
            orig = fields[index].dup
            fields[index].gsub!(/\\(['"\\])/,'\1')
          end
          yield fields
        end
      end
    end
  end
end

# go to town
Wukong::Script.new(
  PagesToTSV::Mapper,
  nil
).run