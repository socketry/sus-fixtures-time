# Sus::Fixtures::Time

Provides a convenient fixtures for time-related tests.

[![Development Status](https://github.com/socketry/sus-fixtures-time/workflows/Test/badge.svg)](https://github.com/socketry/sus-fixtures-time/actions?workflow=Test)

## Motivation

Time-related tests are notoriously flakey due to changes in hardware performance and software load. Typically, a test that measures duration will work fine locally, but fail on a continuous integration (CI) server. This is because the CI server is under load which results in significantly slower test execution times. This gem provides a mechanism to try and measure this overhead, and adjust the test expectations to account for it. This is done by measuring the time taken to perform a simple operation, and then using that as a baseline.

## Usage

Please see the [project documentation](https://socketry.github.io/sus-fixtures-time/) for more details.

  - [Getting Started](https://socketry.github.io/sus-fixtures-time/guides/getting-started/index) - This guide explains how to use the `sus-fixtures-time` gem to test time-related code.

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
