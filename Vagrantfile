Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  config.vm.hostname = "ns.antonio.test" 
  config.vm.network "private_network", ip: "192.168.56.101"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024" 
    vb.cpus = "1"
  end
  config.vm.provision "shell", path: "bootstrap.sh"
end
