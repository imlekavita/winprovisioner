

resource "aws_key_pair""my-key"{
key_name ="mykey"
public_key = "${file{"${var.PATH_TO_PUBLIC_KEY}}"
}


resource "aws_instance""win-example"{ 
ami = "${lookup{var.WIN_AMIs, var.AWS_REGION}}" //win ami finds in my war
instance_type = "t2.micro" 
key_name = "${aws_key_pair.mykey.key_name}"
user_data = <<EOF
<powershell> //Execute boot
net user ${var.Instance_USERNAME} ${var.INSTANCE_PASSWORD} /add new user
net localgroup administrator ${var.INSTANCE_USERNAME} /add

winrm quickconfi -q /winrm is used to upload execute file on windows server.
winrm set winrm/config/winrs '@{MaxMemorypershellMB="300"}'
winrm set winrm/config '@{MaxTimeouters="1800000"}'
winrm set winrm/config/service '@{AlloweUnencrypted="true"}'/some authentication
winrm set winrm/config/service/auth '@{Basic="true"}'

netsh advfirewall firewall add rule name="winRM 5985" protocol=Tcp dir=in localport=5985 action=allow
netsh advfirewall firewall add rule name="winRM 5986" protocol=Tcp dir=in localport=5986 action=allow

net stop winrm /make sure auto start
sc.exe config winrm start=auto
net start winrm
</powershell>
EOF


provisioner "file"{
source = "test.txt"
destination = "c:/test.txt"
}

connection {
type=""winrm
user = "${var.instance_username}"
password = "${var.instance_password}"
}
}