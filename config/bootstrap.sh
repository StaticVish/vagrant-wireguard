echo "Update the Packages"
DEBIAN_FRONTEND=noninteractive apt-get -y update 
DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
DEBIAN_FRONTEND=noninteractive apt-get -y install ansible 

echo "Install Ansible Collections"
cd /vagrant && ansible-galaxy collection install community.general