class chefvm {
  exec { "install chefvm":
    command => "git clone git://github.com/trobrock/chefvm.git ~/.chefvm",
    creates => "/Users/trobrock/.chefvm"
  }

  exec { "add chefvm to path":
    command => "echo '[[ -s \"\$HOME/.chefvm/scripts/chefvm\" ]] && . \"\$HOME/.chefvm/scripts/chefvm\"' >> ~/.zshenv",
    unless  => "grep chefvm ~/.zshenv"
  }
}
