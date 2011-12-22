### This file contains project-specific settings ###

# Use a remote cache to speed things up
# set :deploy_via, :remote_cache

# Multistage support - see config/deploy/[STAGE].rb for specific configs
set :default_stage, "development"
set :stages, %w(production development staging)

# Generally don't need sudo for this deploy setup
set :use_sudo, false

# Some configs live in JSON to make them portable between PHP and Ruby/Cap
require 'json'

_cset(:db_backup_files) { capture("ls -x #{db_backup_dir}", :except => { :no_release => true }).split.sort }
_cset(:db_conf_dir) { File.join(shared_path, "conf") }
_cset(:current_release_stamp) { current_release.split("/").pop }

