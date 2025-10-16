# @summary Manage the /root/.shosts file on the target nodes.
#
# Manage the /root/.shosts file on the target nodes. Could be
# used in a standalone fashion (with proper Hiera data) but
# intended to be used indirectly by including the target class.
#
# This file is required for host-based authentication of the
# root account.
#
# @example
#   include profile_hostbased_ssh::root_shosts
class profile_hostbased_ssh::root_shosts (
  String $root_shosts_path,
) {
  if ! empty($profile_hostbased_ssh::known_hosts::hosts_data) {
    file { $root_shosts_path :
      ensure  => file,
      content => epp( 'profile_hostbased_ssh/shosts.equiv.epp' ),
      group   => 'root',
      owner   => 'root',
      mode    => '0400',
    }
  }
}
