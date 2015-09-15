This role installs Meteor and (optionally) sets up Phantomjs, then clones your git repo, bundles the app and
configures passenger+nginx to run it.

Vars:
General settings
* app_git_repo: (required) "git@github.com:SpaceTalk/SpaceTalk.git" # SSH path to the repo to clone
* app_git_checkout: "master" # branch, tag or commit to checkout
* app_git_relative_dir # path relative to your git repo where your app is
* app_root_dir: "/var/www/meteor_app" # location where your git repo will live on the server fs
* app_bundle_dir: "/var/www/meteor_bundle" # this is the directory where your meteor bundles will live
* app_always_bundle: no # this script will try to avoid bundeling your app if there is already a bundle for the current commit, set to yes/true to overrid
* meteor_settings_file: "settings.json" # location to your settings file relative to the path of your app_root_dir/app_git_relative_dir
* nginx_enable_ssl: no # configure ssl support
* nginx_force_ssl: no # force all traffic through ssl
* nginx_ssl_key_file_name: "spacetalk.key" # filename where your ssl key will be written to
# nginx_ssl_cert_file_name: "spacetalk.pem" # filename where your cert will be written to
* nginx_config_file_name: "meteorapp" # the config file name where your nginx and passenger config will be generated into
* passenger_user: app-www # your app will be owned and run as this user
* passenger_group: app-www # your app will be owned and run as this group
* passenger_friendly_error_pages: 'off' # if changed to 'on' passenger will show stacktraces and env info in your browser when the app crashes
* passenger_port: 80
* git_deploy_private_key # you can set the private key used to checkout repos from git here
* app_mobile_server