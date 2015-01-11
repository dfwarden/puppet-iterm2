# Public: Sets user's com.googlecode.iterm2.plist to settings from
# separate com.googlecode.iterm2.plist in custom folder.
#
# Usage:
#
#   iterm2::customconfig { 'custom iterm2 config path':
#     path => full path to directory to hold custom com.googlecode.iterm2.plist
#   }
class iterm2::customconfig (
  $configdir = "/Users/${::boxen_user}/.iterm2",
) {

file { $configdir:
  ensure => directory
}

boxen::osx_defaults { 'iterm2 custom config dir':
  user => $::boxen_user,
  domain => 'com.googlecode.iterm2',
  key => 'PrefsCustomFolder',
  value => $configdir,
  require => File[$configdir],
}

boxen::osx_defaults { 'iterm2 custom config dir enable':
  user => $::boxen_user,
  domain => 'com.googlecode.iterm2',
  key => 'LoadPrefsFromCustomFolder',
  value => 1,
  require => File[$configdir],
}

}
