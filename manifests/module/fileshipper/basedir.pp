# == Define: icingaweb2::module::fileshipper::basedir
#
# Manage base directories for the fileshipper module
#
# === Parameters
#
# [*identifier*]
#   Identifier of the base directory
#
# [*basedir*]
#   Absolute path of a direcory
#
define icingaweb2::module::fileshipper::basedir(
  $identifier = $title,
  $basedir    = undef,
){
  assert_private("You're not supposed to use this defined type manually.")

  validate_string($identifier)
  validate_absolute_path($basedir)

  $conf_dir        = $::icingaweb2::params::conf_dir
  $module_conf_dir = "${conf_dir}/modules/fileshipper"

  icingaweb2::inisection { "fileshipper-basedir-${identifier}":
    section_name => $identifier,
    target       => "${module_conf_dir}/imports.ini",
    settings     => {
      'basedir' => $basedir,
    }
  }
}
