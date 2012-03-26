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