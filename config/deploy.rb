### This file contains project-specific settings ###

# Multistage support - see config/deploy/[STAGE].rb for specific configs
set :default_stage, "development"
set :stages, %w(production development staging)

# Generally don't need sudo for this deploy setup
set :use_sudo, false

# Some configs live in JSON to make them portable between PHP and Ruby/Cap
require 'json'

# In many cases, you might have a data mount, so provide a single default place
# to store database backups
_cset(:current_release_stamp) { current_release.split("/").pop }
_cset(:db_backup_files) { capture("ls -x #{db_backup_dir}", :except => { :no_release => true }).split.sort }
_cset(:db_conf_dir) { File.join(shared_path, "conf") }
_cset(:db_settings_spare) { which_database("spare") }
_cset(:db_settings_live) { which_database("live") }

def which_database(db)
  run "cat #{shared_path}/default/db_settings.json" do |channel, stream, data|
    info = JSON.parse(data)
    if db == "spare"
      return File.join(db_conf_dir, info["database_spare"])
    else
      return File.join(db_conf_dir, info["database"])
    end
  end
end
