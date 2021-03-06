# Set some defaults:

# Avoid syncing version control files when fetching files from the puppetmaster
File {
  ignore => [ ".svn", "CVS", ".hg", ".git" ],
}

# Give all exec blocks a sane path

Exec {
path => [
"/usr/local/sbin",
"/usr/local/bin",
"/usr/sbin",
"/usr/bin",
"/sbin",
"/bin"
]
}

# Configure extlookup - we're using this to keep sensitive data
#  out of version control and away from third parties.
$extlookup_datadir = "${settings::manifestdir}/extdata"
$extlookup_precedence = ["%{fqdn}", "domain_%{domain}", "common"]


node default {
  crit( "Node only matched \"default\" for which there is no configuration, $::hostname" )
}
