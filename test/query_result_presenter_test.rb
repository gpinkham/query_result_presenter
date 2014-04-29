require 'test_helper'

class QueryResultPresenterTest < Test::Unit::TestCase
  context "Query Result Presenter" do
    def setup
      @result = [
        {"column1" => "row1", "column2" => "row1"},
        {"column1" => "row2", "column2" => "row2"},
        {"column1" => "row3", "column2" => "row3"}
      ]
      @presenter = QueryResultPresenter::Presenter.new(@result)
    end

    context "headers" do
      should "have the correct headers" do
        headers = ["column1", "column2"]
        assert_equal(headers, @presenter.headers)
      end
    end

    context "first_result_row" do
      should "have the correct result row" do
        assert_equal(["row1", "row1"], @presenter.first_result_row)
      end
    end

    context "to_html_table" do
      should "show correct table" do
        table = "<table><tr><td>column1</td><td>column2</td></tr><tr><td>row1</td><td>row1</td></tr><tr><td>row2</td><td>row2</td></tr><tr><td>row3</td><td>row3</td></tr></table>"
        assert_equal(table, @presenter.to_html_table)
      end
    end

    context "to_csv_data" do
      should "return csv data in the form of a string" do
        csv = "column1,column2\nrow1,row1\nrow2,row2\nrow3,row3\n"
        assert_equal(csv, @presenter.to_csv_data)
      end
    end

    context "field_values" do
      should "have the correct field values" do
        assert_equal(["row1", "row2", "row3"], @presenter.field_values('column2'))
      end
    end

    context "has_results?" do
      should "return true when there are results" do
        assert_equal(true, @presenter.has_results?)
      end
    end

    context "result_count" do
      should "return the correct number of results" do
        assert_equal(3, @presenter.result_count)
      end
    end

    context "method_missing" do
      should "delegate to the underlying result if method is missing" do

      end

      should "raise an error when calling an unknown method" do

      end
    end

    context "respond_to?" do
      should "be true for presenter methods" do

      end

      should "be true for underlying methods" do

      end

      should "be false for unknown methods" do

      end
    end

  end
end
