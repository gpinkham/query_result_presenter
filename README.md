# QueryResultPresenter

[![Code Climate](https://codeclimate.com/github/paperlesspost/query_result_presenter.png)](https://codeclimate.com/github/paperlesspost/query_result_presenter)

This is a gem to deal with a variety of query results from the
various database adapters that run in ruby. Most of them (pg, mysql2)
natively return a query result in the form of an enumerable, with each
result being a hash with the column name and row value of the query.

This code adds functionality to the results of these
database adapters, and simplifies some common things you need for
query reporting, especially online.

This gem uses the decorator
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

All you need to do is call `QueryResultPresenter::Presenter.new(result here)`
on any query result returned as a hash, and you will get these
additional methods. If you call an unrecognized method, it will 
call that method on the original result object using `method_missing`.

This project started as `PgResultPresenter` to be used with a postgres
database that returnd `PgResult` objects to which we added 
functionality. However, since we're open sourcing our BI app, and people
will likely use non-postgres db's, this gem is to extend that
functionality beyond just postgres.

So, the `(result here)` that you load into the presenter will be a result
from `pg`, `mysql2`, or another db connection library. The results can 
be different types /
classes, but most conform to the same format which allows this gem to
work.

The format needed for this to work is for results to be returned as
hashes, this will not work for query results
returned as an array. Most libraries return results as hashes by
default, or you are able to change the configuration in the library to
return the result as a hash.

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
