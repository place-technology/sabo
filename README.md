# Sabo

A SOAP client with WDSL support.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     sabo:
       github: grkek/sabo
   ```

2. Run `shards install`

## Usage

```crystal
require "sabo"

document = Sabo::WSDL::Document.new("./example/input.wsdl")
client = Sabo::Client.new(document: document, version: "1.2")

puts client.operations

response = client.call(operation: "NumberToWords", body: {"ubiNum" => Sabo::Parameter.new(1000)})

puts response
  .json
  .["Envelope"]
  .["Body"]
  .["NumberToWordsResponse"]
  .["NumberToWordsResult"]
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/sabo/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Giorgi Kavrelishvili](https://github.com/your-github-user) - creator and maintainer
