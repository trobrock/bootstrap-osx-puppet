Exec {
  path        => '/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin',
  environment => "HOME=/Users/$id"
}

include chefvm

class bootstrap::packages {
  $pkglist = ['rsnapshot', 'git', 'imagemagick', 'irssi', 'mongodb', 'mtr', 'nmap', 'qt', 'reattach-to-user-namespace', 'redis', 'sqlite', 'tmux', 'watch', 'wget']

  package { $pkglist:
    provider => brew,
    ensure   => latest
  }

  package { "wemux":
    provider => brew,
    ensure   => installed
  }
}
include bootstrap::packages
