require "clamd_for_centos/version"

module ClamdForCentos
  def self.setup
    status =  system("sudo  yum install clamav clamav-scanner-sysvinit clamav-update -y")
    # if status == true
    file_edit = system("sudo sed -i -e 's/^Example/#Example/' /etc/clamd.d/scan.conf")
    file_scanff = system(" echo 'LocalSocket /var/run/clamd.scan/clamd.sock' | sudo tee -a /etc/clamd.d/scan.conf")

    file_fresh_clam = system("sudo sed -i -e 's/^Example/#Example/' /etc/freshclam.conf")
    system("sudo freshclam")
    system("sudo service clamd.scan start")
    system("sudo chkconfig clamd.scan on")
    # else 
    puts "rerun with sudo"
    # end
  end


end
