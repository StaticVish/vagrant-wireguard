$OS_IMAGE = "roboxes/ubuntu2004"
$BOX_VERSION = "4.2.14"
$SERVER_NAME = "wireguard-server"

required_plugins = %w(vagrant-reload )

plugins_to_install = required_plugins.select { |plugin| not Vagrant.has_plugin? plugin }
if not plugins_to_install.empty?
  puts "Installing plugins: #{plugins_to_install.join(' ')}"
  if system "vagrant plugin install #{plugins_to_install.join(' ')}"
    exec "vagrant #{ARGV.join(' ')}"
  else
    abort "Installation of one or more plugins has failed. Aborting."
  end
end


Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.define $SERVER_NAME do |master|
    master.vm.box = $OS_IMAGE
    master.vm.box_version = $BOX_VERSION

    master.vm.synced_folder "./config", "/vagrant", type: "rsync",
      rsync__exclude: ".git/",
      rsync__args: ["--verbose", "--archive", "--compress"]

    master.vm.hostname = $SERVER_NAME
    master.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--name", $SERVER_NAME]
      v.customize ["modifyvm", :id, "--cpus", 2]
    end
    master.vm.provision "shell", path: "./config/bootstrap.sh", privileged: true 
    master.vm.provision :reload
     master.vm.provision "ansible_local" do |ansible|
      ansible.become = true
      ansible.playbook = "/vagrant/playbook.yml"
      ansible.verbose = true   
    end
  end
end