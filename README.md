# avro.cr

avro for [Crystal](http://crystal-lang.org/).

- crystal: 0.24.1
- status: **Nothing implemented yet**

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  avro:
    github: maiha/avro.cr
    version: 0.1.0
```

## Usage

```crystal
require "avro"
```

## TODO

- [x] `lib_avro.cr`
- [ ] **core**
  - [ ] parse schemas from JSON
  - [ ] read and write binary data for a schema
- [ ] **data file**
  - [ ] read and write Avro data files
- [ ] **codec**
  - [ ] deflate
  - [ ] snappy
- [ ] **RPC/HTTP**
  - [ ] make and recieve RPC calls over HTTP

Above features are defined in following page.
- https://cwiki.apache.org/confluence/display/AVRO/Supported+Languages

## Development

1. install header and lib files
- https://github.com/apache/avro

2. make `src/lib_avro.cr`
- https://github.com/crystal-lang/crystal_lib
```shell
crystal src/main.cr lib_avro.cr
```

## Contributing

1. Fork it ( https://github.com/maiha/avro.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [maiha](https://github.com/maiha) maiha - creator, maintainer
