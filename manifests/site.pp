Exec {
  path        => '/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin',
  environment => "HOME=/Users/$id"
}

include chefvm

class bootstrap::packages {
  $vcs_pkglist  = ['mercurial', 'git']
  $lang_pkglist = ['python']
  $pkglist      = ['vim', 'rsnapshot', 'imagemagick', 'irssi', 'mongodb',
    'mtr', 'nmap', 'qt', 'reattach-to-user-namespace', 'redis', 'sqlite',
    'tmux', 'watch', 'wget', 'autoconf', 'automake', 'apple-gcc42', 'rbenv',
    'ruby-build', 'hub', 'ack']

  exec { "tap homebrew/dupes":
    command => "brew tap homebrew/dupes",
    unless  => "brew info vim"
  }

  package { $lang_pkglist:
    provider => brew,
    ensure   => installed
  }

  package { $vcs_pkglist:
    provider => brew,
    ensure   => latest
  }

  package { $pkglist:
    provider => brew,
    ensure   => latest
  }

  package { "wemux":
    provider => brew,
    ensure   => installed
  }

  Exec["tap homebrew/dupes"] -> Package[$lang_pkglist]
  Package[$lang_pkglist] -> Package[$vcs_pkglist] -> Package[$pkglist]
  Package[$lang_pkglist] -> Package[$vcs_pkglist] -> Package["wemux"]
}
include bootstrap::packages
