# -*- mode: ruby -*-
# vi: set ft=ruby :

#ENV['VAGRANT_NO_PARALLEL'] = 'yes'

# vagrant plugin install vagrant-vbguest
# vagrant vbguest

Vagrant.configure("2") do |config|
	config.vm.define "deb-11" do |afaraji|
		afaraji.vm.box = "debian/buster64"
		afaraji.vm.hostname = "deb-11"
		afaraji.vm.box_url = "debian/buster64"
		afaraji.vm.network :private_network, ip: "192.168.10.10"
		afaraji.vm.provider :virtualbox do |v|
			v.customize ["modifyvm", :id, "--name", "deb-11"]
			v.customize ["modifyvm", :id, "--memory", 4096]
			v.customize ["modifyvm", :id, "--cpus", "2"]
		end
		#afaraji.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/tmp/id_rsa.pub"
		afaraji.vm.synced_folder ".", "/home/vagrant/inception"
		afaraji.vm.provision "shell", inline: <<-SHELL
		apt-get update
		apt-get install -y -q net-tools curl vim
		curl -fsSL https://get.docker.com -o get-docker.sh
		sh get-docker.sh
		systemctl start docker
		systemctl enable docker
		curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose
		docker ps && echo "[INFO] Docker installed successful" || echo"[INFO] Error installing Docker"
		rm -rf get-docker.sh
		usermod -aG docker vagrant
		echo "127.0.0.1	afaraji.1337.ma" >> /etc/hosts
		echo "127.0.0.1	afaraji.42.fr" >> /etc/hosts
		echo "127.0.0.1	www.afaraji.1337.ma" >> /etc/hosts
		echo "127.0.0.1	www.afaraji.42.fr" >> /etc/hosts
		mkdir /home/afaraji && mkdir /home/afaraji/data && mkdir /home/afaraji/data/wp_data && mkdir /home/afaraji/data/db_data
		usermod -u 1050 systemd-coredump && groupmod -g 1050 systemd-coredump
		useradd -u 999 mysql && groupmod -g 999 mysql
		chown -R mysql:mysql /home/afaraji/data/db_data/
		usermod -u 82 www-data && groupmod -g 82 www-data
		chown -R www-data:www-data /home/afaraji/data/wp_data/
		# useradd -d /home/afaraji -s /bin/bash -p $(perl -e 'print crypt($ARGV[0], "password")' '  ') afaraji
		# mkdir /home/afaraji/.ssh
		# cat /tmp/id_rsa.pub >> /home/afaraji/.ssh/authorized_keys
		SHELL
	end
end
