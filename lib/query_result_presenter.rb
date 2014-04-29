require "query_result_presenter/version"
require 'csv'

module QueryResultPresenter
  # Your code goes here...
  def self.new(result)
    QueryResultPresenter.new(result)
  end

  class QueryResultPresenter
    attr_reader :result

    def initialize(result)
      @result = result
    end

    def to_csv_data
      has_results? ? csv_data : ""
    end

    def to_csv_file(filename)
      File.open(filename, "w"){ |f| f.puts csv_data }
    end

    def to_html_table
      html_table = "<table>"
      html_table << add_html_row(headers)
      @result.each do |row|
        html_table << add_html_row(row.values)
      end
      html_table << "</table>"
      html_table
    end

    def headers
      @result.first.keys
    end

    def field_values(field_name)
      @result.to_a.map{ |r| r[field_name] }
    end

    def first_result_row
      @result.first.values
    end

    def has_results?
      result_count > 0
    end

    def result_count
      @result.count
    end

    def method_missing(method, *args, &block)
      @result.send(method, *args, &block)
    end

    private

    def add_html_row(row_data)
      row = "<tr>"
      row_data.each do |d|
        row << "<td>#{d}</td>"
      end
      row << "</tr>"
      row
    end

    def csv_data
      csv_data = CSV.generate do |csv|
        csv << headers
        @result.each do |r|
          csv << r.values
        end
      end
      csv_data
    end

  end
end
