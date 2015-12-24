class mco_test {
  Class['puppet_enterprise::mcollective::server::plugins'] -> Class[$title] ~> Service['mcollective']
  include puppet_enterprise
  $plugin_basedir = "${puppet_enterprise::params::mco_plugin_userdir}/mcollective"
  $mco_etc        = $puppet_enterprise::params::mco_etc

  File {
    owner => $puppet_enterprise::params::root_user,
    group => $puppet_enterprise::params::root_group,
    mode  => $puppet_enterprise::params::root_mode,
  }
  
 file {"${plugin_basedir}/agent/shell":
    ensure => directory,
  }

  file {"${plugin_basedir}/agent/shell.ddl":
    ensure => file,
    source => 'puppet:///modules/mco_test/mcollective-shell-agent/lib/mcollective/agent/shell.ddl',
  }

  file {"${plugin_basedir}/agent/shell.rb":
    ensure => file,
    source => 'puppet:///modules/mco_test/mcollective-shell-agent/lib/mcollective/agent/shell.rb',
  }
  
  file {"${plugin_basedir}/agent/shell/job.rb":
    ensure => file,
    source => 'puppet:///modules/mco_test/mcollective-shell-agent/lib/mcollective/agent/shell/job.rb',
  }
   
  file {"${plugin_basedir}/application/shell":
    ensure => directory,
  }

  file {"${plugin_basedir}/application/shell.rb":
    ensure => file,
    source => 'puppet:///modules/mco_test/mcollective-shell-agent/lib/mcollective/application/shell.rb',
  }

  file {"${plugin_basedir}/application/shell/prefix_stream_buf.rb":
    ensure => file,
    source => 'puppet:///modules/mco_test/mcollective-shell-agent/lib/mcollective/application/shell/prefix_stream_buf.rb',
  }

  file {"${plugin_basedir}/application/shell/watcher.rb":
    ensure => file,
    source => 'puppet:///modules/mco_test/mcollective-shell-agent/lib/mcollective/application/shell/watcher.rb',
  }
}
