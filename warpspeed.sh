# test
# warpspeed.sh
# Commands here will be run each time a pull or push deploy is successfully run.

RUBY_VERSION=2.1.4

# Make sure the correct ruby version is installed.
if [ ! -d "$HOME/.rbenv/versions/$RUBY_VERSION" ]; then
    rbenv install $RUBY_VERSION
fi

# Ensure the proper version of ruby is specified.
rbenv local $RUBY_VERSION

# Install necessary gems.
bundle install

# Restart passenger.
mkdir -p tmp
touch tmp/restart.txt
