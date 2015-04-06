vcenter::host { 'vsphere01.vmtrooper.com':
  path => "/VMTrooperHQ",
  username => "root",
  password => "Puppetize1234",
  shells => {
    esxi_shell => {
      running => true,
      policy => 'on',
    },
    ssh => {
      running => true,
      policy => 'on',
    },
    esxi_shell_time_out => 0,
    esxi_shell_interactive_time_out => 0,
    suppress_shell_warning => 1,
  },
  servicesConfig => {
    dcui => {
      running => true,
      policy => 'on',
    },
    esxi_shell => {
      running => true,
      policy => 'on',
    },
    ssh => {
      running => true,
      policy => 'on',
	},
￼￼},
  transport => Transport['vcenter'],
}

transport { 'vcenter':
  username => 'administrator',
  password => 'Puppetize1234',
  server   => 'vcenter.vmtrooper.com',
  options  => { 'insecure' => true }
 # options  => $vcenter['options'],
}