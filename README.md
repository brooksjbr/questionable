Questionable
============

Questionable is a simple rails engine that is intended to be mountable by a parent rails application to provide basic question and answer functionality. All engine resources are namedspaces under the questionable engine.

## Installation

To use it, add it to your Gemfile:

```ruby
gem 'questionable', git: "git://github.com/brooksjbr/questionable"
```

and bundle:

```shell
$ bundle
```

#### Post Installation

Install migrations
```shell
rake db:migrate
```
