Exec { path => '/usr/bin:/bin:/usr/sbin:/sbin' }

include chefvm

package { "rsnapshot":
  provider => brew,
  ensure   => latest
}
