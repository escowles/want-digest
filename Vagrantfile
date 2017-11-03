# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"

  # setup the shared folder
  home_dir = "/home/vagrant"

  # forward port 8080 for nginx
  config.vm.network :forwarded_port, guest: 80, host: 8080

  # default to 2gb of memory, but allow overrides
  config.vm.provider "virtualbox" do |v|
    v.memory = ENV.fetch("VAGRANT_MEMORY", "2048")
  end

  # setup script
  config.vm.provision :shell, :path => "./setup.sh"
end
