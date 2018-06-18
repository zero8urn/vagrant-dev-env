Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.synced_folder "./projects/", "/home/vagrant/projects", type: "virtualbox"
 
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
	vb.customize ["modifyvm", :id, "--memory", "8192"] #2048
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--graphicscontroller", "vboxvga"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
	vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
	vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']

  end


$script = <<-SCRIPT
echo provisioning...
sudo apt update

sudo apt -y install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

sudo echo "allowed_users=anybody" > /etc/X11/Xwrapper.config
sudo echo "LANG=en_US.UTF-8" >> /etc/default/locale
sudo echo "LANGUAGE=en_US.UTF-8" >> /etc/default/locale
sudo echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale
sudo echo "LC_CTYPE=en_US.UTF-8" >> /etc/default/locale

sudo apt -y install maven git gradle
sudo apt -y install openjdk-8-jdk

#to run from cli enter: intellij-idea-community
sudo snap install intellij-idea-community --classic --edge
sudo cp /var/lib/snapd/desktop/applications/intellij-idea-community_intellij-idea-community.desktop /usr/share/applications/

sudo snap install eclipse --classic --edge
sudo cp /var/lib/snapd/desktop/applications/eclipse_eclipse.desktop /usr/share/applications/

sudo apt -y install xfce4 
sudo apt -y install xfce4-terminal

#Setup Docker
sudo apt -y install apt-transport-https ca-certificates curl software-properties-commo
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt -y install docker-ce

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#Theme It
sudo wget -N https://gitlab.com/sixsixfive/DarK-theme/-/archive/master/DarK-theme-master.zip
sudo unzip DarK-theme-master.zip 
sudo mv DarK-theme-master/DarK /usr/share/themes/

sudo wget -N https://gitlab.com/sixsixfive/DarK-icons/-/archive/master/DarK-icons-master.zip
sudo unzip DarK-icons-master.zip 
sudo mv DarK-icons-master/DarK /usr/share/icons

sudo wget -N https://pre00.deviantart.net/fa3a/th/pre/f/2015/300/8/e/highway_by_axiomdesign-d9em9fs.jpg
sudo mv highway_by_axiomdesign-d9em9fs.jpg /usr/share/backgrounds/xfce/

sudo cp /vagrant/config/startup_config.sh /home/vagrant
sudo chmod +X /home/vagrant/startup_config.sh

sudo mkdir -p /home/vagrant/.config/autostart/ 
sudo cp /vagrant/config/startup_config.desktop /home/vagrant/.config/autostart/



sudo cp /vagrant/config/.vimrc /home/vagrant/


#TO run the desktop gui
#From local desktop run
#vagrant ssh
#From VM run 
#sudo startx


SCRIPT

 config.vm.provision "shell", inline: $script, privileged: false
  
end