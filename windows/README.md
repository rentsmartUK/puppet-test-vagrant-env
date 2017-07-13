# Vagrant Puppet Windows Test Environment

## Requirements

- Vagrant 1.9.3 +
- VirtualBox 5.1.18 r114002 (Qt5.6.2) +

## Set up the environment

To bootstrap the environment, run the following command form this

```bash
vagrant up
```

Once the machine is up and running, execute the following command into PowerShell in order to install puppet (please change it if new versions of puppet are meant to be used)

```shell
msiexec.exe /I 'C:/vagrant/binaries/puppet-agent-1.10.4-x86.msi'
```

Make sure puppet is installed by closing the PowerShell console and running:

```shell
puppet --version
```

It should prompt the version of puppet agent currently installed

## Start testing

From the Windows machine, in PowerShell execute the following example puppetfile:

```shell
cd C:\vagrant\code
puppet apply test_localacc.pp
```

Please read carefully the example provided in code, as there are modules specified in the headers that need to be installed in puppet via `puppet module install` command.

## Contribute

Please bear in mind that this repository is public, so do not post sensitive data.

- `binaries` contains the desired puppet-agent binaries that need to be installed into the Windows agent
- `code` contains the puppet test code 
