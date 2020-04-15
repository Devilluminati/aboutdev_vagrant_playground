Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.disksize.size = '50GB'
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = "vagrant_playground"
    vb.gui = true
    vb.customize ["modifyvm", :id, "--monitorcount", "1"]
	vb.customize ["modifyvm", :id, "--clipboard-mode", "bidirectional"]
	vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
    vb.memory = "8196"
    vb.cpus = 2
  end
  
  config.vm.provision "ansible_local" do |ansible|
    ansible.become = true
    ansible.config_file = "/vagrant/ansible/ansible.cfg"
    ansible.playbook = "/vagrant/ansible/playbooks/provision.yml"
    ansible.tags = "shell,docker,desktop,java,idea,nodejs,python,go,ruby"
    ansible.galaxy_role_file = "/vagrant/ansible/requirements.yml"
    ansible.galaxy_roles_path = "/etc/ansible/roles"
    ansible.galaxy_command = "sudo ansible-galaxy install --role-file=%{role_file} --roles-path=%{roles_path} --force"
    ansible.extra_vars = {
      proxy_env: {},
      maven_version: "3.6.0",
	  intellij_version: "2019.3.3",
      intellij_edition: "community"
   }
  end
  
  #Trigger for vagrant up to reload the VM, takes place every time you start the box, so you don't need the vagrant-reload plugin
  config.trigger.after [:up] do |t|
    t.name = "Reboot after provisioning"
    t.run = { :inline => "vagrant reload" }
  end
end
