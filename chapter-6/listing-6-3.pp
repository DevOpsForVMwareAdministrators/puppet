vcenter::host { 'vsphere01.vmtrooper.com':
  path => "/VMTrooperHQ",
  username => "root",
  password => "Puppetize1234",
  transport => Transport['vcenter'],
}
transport { 'vcenter':
  username => 'administrator',
  password => 'Puppetize1234',
  server   => 'vcenter.vmtrooper.com',
  options  => { 'insecure' => true }
}