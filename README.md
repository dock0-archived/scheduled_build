scheduled\_build
=======

[![MIT Licensed](http://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Lightweight scripts to trigger builds of my Automated Builds on Docker Hub

## Usage

Put this codebase somewhere where you can run `./bin/trigger_build.rb` when you want to. You can pass repo information to it via environment variables or command line args:

```
# export TRIGGER_TOKENS="dock0/arch:1234567890|dock0/other_image:0987654321"
# ./bin/trigger_build.rb
Triggering build for dock0/arch
Triggering build for dock0/other_image
```

```
# ./bin/trigger_build.rb dock0/arch:1234567890 dock0/other_image:0987654321
Triggering build for dock0/arch
Triggering build for dock0/other_image
```

I run this using a Heroku dyno and the free Heroku Scheduler.

## License

This code is released under the MIT License. See the bundled LICENSE file for details.

