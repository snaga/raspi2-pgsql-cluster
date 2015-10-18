#!/bin/sh

sudo apt-get install ruby-dev
sudo gem install fluentd --no-ri --no-rdoc -V
sudo gem install fluent-plugin-parser --no-ri --no-rdoc -V
sudo gem install fluent-plugin-rewrite-tag-filter --no-ri --no-rdoc -V

PATH=/usr/pgsql-9.4/bin:$PATH
export PATH

sudo env PATH=$PATH gem install fluent-plugin-pgjson --no-ri --no-rdoc -V
