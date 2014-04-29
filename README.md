# QueryResultPresenter

This gem helps you work with query results. It uses the presenter
pattern, so it adds some additional methods and delegates to the
original result for anything it doesn't recognize.

## Installation

Add this line to your application's Gemfile:

    gem 'query_result_presenter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install query_result_presenter

## Usage

All you need to do is call `QueryResultPresenter.new(result here)`
on any query result returned as a hash, and you will get these
additional methods. If you call an unrecognized method, it will 
call that method on the original result object.

Note, this will not work for query results
returned as an array, which happens with some libraries, although you
can normally change that functionality.

The additional functions you get are:

`to_html_table` turns the query result to an html table

`to_csv_data` gives you a csv string

`to_csv_file(filename)` saves a csv file of filename. Will overwrite
previous files

`headers` gets you the headers of the query result (column names)

`field_values(column)` gets you the values of an individual column as an
array

`first_result_row` gets you the first row of the result

`has_results?` returns true if there are results

`result_count` returns the number of results

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
