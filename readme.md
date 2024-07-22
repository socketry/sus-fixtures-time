# Sus::Fixtures::Async::HTTP

Provides a convenient fixtures for time-related tests.

[![Development Status](https://github.com/socketry/sus-fixtures-time/workflows/Test/badge.svg)](https://github.com/socketry/sus-fixtures-time/actions?workflow=Test)

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

## Contributing

We welcome contributions to this project.

1.  Fork it.
2.  Create your feature branch (`git checkout -b my-new-feature`).
3.  Commit your changes (`git commit -am 'Add some feature'`).
4.  Push to the branch (`git push origin my-new-feature`).
5.  Create new Pull Request.

### Developer Certificate of Origin

In order to protect users of this project, we require all contributors to comply with the [Developer Certificate of Origin](https://developercertificate.org/). This ensures that all contributions are properly licensed and attributed.

### Community Guidelines

This project is best served by a collaborative and respectful environment. Treat each other professionally, respect differing viewpoints, and engage constructively. Harassment, discrimination, or harmful behavior is not tolerated. Communicate clearly, listen actively, and support one another. If any issues arise, please inform the project maintainers.
