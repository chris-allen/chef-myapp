Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    # The AWS api forces signed requests to be no older than 5 minutes. If you leave a vagrant VM running while your
    # host OS sleeps, you can experience a drastic time skew on the guest OS.
    #
    # This forces the system time to sync every 10 seconds as opposed to the default 20 minutes.  If you still
    # experience AWS 400 errors, the solution is to run `vagrant reload`.
    v.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000 ]
  end
  config.vm.hostname = "myapp-berkshelf"
  config.vm.box = "ubuntu/trusty64"

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :public_network, bridge: "en1: Wi-Fi (AirPort)"
  config.vm.boot_timeout = 120

  config.berkshelf.enabled = true
  config.omnibus.chef_version = "12.10.24"

  config.vm.synced_folder "../", "/home/vagrant/myapp"

  # OSX needs this for concurrent open files
  config.vm.provision :shell, :inline => "ulimit -n 4048"

  # This is needed for windows 7 (not sure about later versions)
  config.vm.provision :shell, :inline => <<-SHELL
    echo 'Acquire::ForceIPv4 "true";' | tee /etc/apt/apt.conf.d/99force-ipv4
  SHELL

  config.vm.provision :chef_solo do |chef|
    # chef.log_level = :fatal
    chef.json = {
      "vagrant" => {
        "symlink_npm" => (RbConfig::CONFIG["host_os"] =~ /cygwin|mswin|mingw/) ? true : false
      }
    }
    chef.run_list = [
      "recipe[chef-myapp::system]",
      "recipe[chef-myapp::server]",
      "recipe[chef-myapp::dev_database]",
      "recipe[chef-myapp::wordpress]",
    ]
  end
end