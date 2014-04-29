require "query_result_presenter/version"
require 'csv'

# This is a module to deal with a variety of query results from the
# various database adapters that run in ruby. Most of them (pg, mysql2)
# natively return a query result in the form of an enumerable, with each
# result being a hash with the column name and row value of the query.
#
# This code is to allow you to add functionality to the results of these
# database adapters, and automate certain common things you need for
# query reporting, especially online.
module QueryResultPresenter
  class Presenter
    attr_reader :result

    def initialize(result)
      @result = result
    end

    # Get the csv data in the form of a string
    # @return [String]
    def to_csv_data
      has_results? ? csv_data : ""
    end

    # Saves a query result to file. Will overwrite any file with the
    # same name
    # @param [String] filename the name of the file eg 'file.csv'
    def to_csv_file(filename)
      File.open(filename, "w"){ |f| f.puts csv_data }
    end

    # Returns the query result as an html table string
    # @return [String]
    def to_html_table
      html_table = "<table>"
      html_table << add_html_row(headers)
      @result.each do |row|
        html_table << add_html_row(row.values)
      end
      html_table << "</table>"
      html_table
    end

    # Returns the column names from the query result
    # @return [Array]
    def headers
      @result.first.keys
    end

    # Gets the values in every row for a specific column
    # @param [String] column_name
    # @return [Array]
    def field_values(column_name)
      @result.to_a.map{ |r| r[column_name] }
    end

    # Gets the first row from the query result
    # @return [Array]
    def first_result_row
      @result.first.values
    end

    # Does this query have any results?
    # @return [Boolean]
    def has_results?
      result_count > 0
    end

    # How many rows are in the query result
    # @return [Integer]
    def result_count
      @result.count
    end

    def method_missing(method, *args, &block)
      @result.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      super || @result.respond_to?(method, include_private)
    end

    private

    # Returns an array as an html row
    # @param [Array] row_data the array you want to turn into a row
    # @return [String]
    def add_html_row(row_data)
      row = "<tr>"
      row_data.each do |d|
        row << "<td>#{d}</td>"
      end
      row << "</tr>"
      row
    end

    # Get the csv data in the form of a string
    # @return [String]
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
