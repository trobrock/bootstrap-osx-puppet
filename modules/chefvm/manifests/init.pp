class chefvm {
  exec { "install chefvm":
    command => "git clone git://github.com/trobrock/chefvm.git ~/.chefvm",
    creates => "/Users/trobrock/.chefvm"
  }
}
