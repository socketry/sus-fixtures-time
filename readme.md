# Sus::Fixtures::Async::HTTP

Provides a convenient fixture for running a web server.

[![Development Status](https://github.com/socketry/sus-fixtures-async-http/workflows/Test/badge.svg)](https://github.com/socketry/sus-fixtures-async-http/actions?workflow=Test)

## Installation

``` bash
$ bundle add sus-fixtures-time
```

## Usage

``` ruby
let(:quantum) {Sus::Fixtures::Time::Quantum}

it 'measures time' do
	expect{sleep(1)}.to have_duration(be_within(quantum).of(1))
end
```
