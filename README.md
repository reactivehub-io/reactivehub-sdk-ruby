# reactivehub.io Ruby SDK

The reactivehub.io Ruby SDK implements the methods to publish in [Event](https://docs.reactivehub.io/guide/events) api 

## Installation

Via Gemfile
``` gem reactivehub_sdk```

## Usage

```
require 'reactivehub_sdk'

client = build_client('<your-client-key>', '<your-client-secret>', 'your-team-name')

payload = '{ "name": "my-name" }'

reactivehub.send_event(client, "my-event", payload)
```

## How to contribute
We'd love to accept your patches and contributions to this project. There are just a few small guidelines you need to follow.

Contributor License Agreement
Contributions to this project must be accompanied by a Contributor License Agreement. You (or your employer) retain the copyright to your contribution, this simply gives us permission to use and redistribute your contributions as part of the project.

You generally only need to submit a CLA once, so if you've already submitted one (even if it was for a different project), you probably don't need to do it again.

## Code reviews
All submissions, including submissions by project members, require review. We use GitHub pull requests for this purpose. Consult GitHub Help for more information on using pull requests.

## License

The contents of this repository is licensed under the
[Apache License, version 2.0](http://www.apache.org/licenses/LICENSE-2.0).



