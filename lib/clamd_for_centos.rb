require "clamd_for_centos/version"

module ClamdForCentos
  # Your code goes here...
  def self.setup
    status =  system("sudo yum -y install clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd")
    if status == true
    file_edit = system("sudo sed -i -e 's/^Example/#Example/' /etc/clamd.d/scan.conf")
    f = File.open('/etc/clamd.d/scan.conf', 'a')
    f.write('LocalSocket /var/run/clamd.scan/clamd.sock')
    f.close
    file_fresh_clam = system("sudo sed -i -e 's/^Example/#Example/' /etc/freshclam.conf")
    system("sudo freshclam")
    system("sudo systemctl start clamd@scan")
    system("sudo systemctl enable clamd@scan")
    else 
    puts "rerun with sudo"
    end
  end


end
