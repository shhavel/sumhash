# Sumhash [![Build Status](https://api.travis-ci.org/shhavel/sumhash.svg?branch=master)](https://travis-ci.org/shhavel/sumhash)

Provides summing operations to Hashes and OpenStructs

Works with nested structures

## Install

Add Sumhash to your Gemfile:

```ruby
gem 'sumhash', :git => 'git://github.com/shhavel/sumhash.git'
```

## Examples

Simple usage

```ruby
{ one: 1.0, two: 2.3 } + { one: 2.0, two: 2.0 }

```

This will result in:

```ruby
{ one: 3.0, two: 4.3 }
```


With different keys

```ruby
{ one: 1.1, two: 2.3, three: 3.4 } + { two: 3.2, four: 4.5 } + { one: 1.0, two: 2.0 }
```

This will result in:

```ruby
{ one: 2.1, two: 7.5, three: 3.4, four: 4.5 }
```

## Example with nested OpenStruct

```ruby
hashes = [
  { one: 1, two: 2, resume: OpenStruct.new(result: 10) },
  { two: 2, resume: OpenStruct.new(result: 20) }
]

hashes.reduce(:+)
```

This will result in:

```ruby
{ one: 1, two: 4, resume: OpenStruct.new(result: 30) }
```
