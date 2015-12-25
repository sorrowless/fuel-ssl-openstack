notice('MODULAR: fuel-ssl-openstack/hiera_override.pp')

$plugin_name = 'fuel-ssl-openstack'
$ssl_hash    = hiera($plugin_name, undef)

if $ssl_hash {
  $hiera_dir   = '/etc/hiera/plugins'
  $plugin_yaml = "${plugin_name}.yaml"

  file { 'hiera_dir':
    ensure  => directory,
    path    => $hiera_dir,
  }

  $content = inline_template('<%
require "yaml"

data = {
  "use_ssl" => @ssl_hash,
}
-%>
<%= YAML.dump data %>')

  file { "${hiera_dir}/${plugin_yaml}":
    ensure  => file,
    content => $content,
  }
}
