# Sumhash [![Build Status](https://api.travis-ci.org/shhavel/sumhash.svg?branch=master)](https://travis-ci.org/shhavel/sumhash)

Provides summation operation for `Hash` and `OpenStruct`

Works with nested structures

## Install

Add `sumhash` to your Gemfile:

```ruby
gem "sumhash"
```

## Usage

`Hash`es with same keys

```ruby
{ one: 1.0, two: 2.3 } + { one: 2.0, two: 2.0 }

```

Result:

```ruby
{ one: 3.0, two: 4.3 }
```

With different keys

```ruby
{ one: 1.1, two: 2.3, three: 3.4 } + { two: 3.2, four: 4.5 } + { one: 1.0, two: 2.0 }
```

Result:

```ruby
{ one: 2.1, two: 7.5, three: 3.4, four: 4.5 }
```

## `Hash`es with nested `OpenStruct`

```ruby
hashes = [
  { one: 1, two: 2, resume: OpenStruct.new(result: 10) },
  { two: 2, resume: OpenStruct.new(result: 20) }
]

hashes.reduce(:+)
```

Result:

```ruby
{ one: 1, two: 4, resume: OpenStruct.new(result: 30) }
```
