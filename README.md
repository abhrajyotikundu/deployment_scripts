                   
Please use grant or revoke the ssh access using following command:

hostname# ] ansible-playbook playbook.yml

--------------------------
cat /etc/ansible/hosts   |
[group1]                 |
server1                  |
server2                  |
server3                  |
.                        |
.                        |
.                        |
servern                  |
--------------------------


Warning : Please make sure that the hosts file has the correct list of servers. Else it will be deployed in the unwanted host.

If you want to revoke access please replace the grant string with revoke in playbook.yml