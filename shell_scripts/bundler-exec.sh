bundle_commands=( spec rspec cucumber cap watchr rails rackup )

function run_bundler_cmd () {
    if [ -e ./Gemfile ]; then
        echo "bundle exec $@"
        bundle exec $@
    else
        echo "$@"
        $@
    fi
}

for cmd in $bundle_commands
do
    alias $cmd="run_bundler_cmd $cmd"
done
