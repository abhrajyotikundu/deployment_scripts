export user=$2

if [ $# -eq 2 ];
then
if [ $1 = "grant" ];
then
search_str="AllowUsers"
elif [ $1 = "revoke" ];
then
search_str="DenyUsers"
else
echo "Invalid parameters passed: Please use the script as per below example"
echo "sh ssh_access_control.sh (grant|revoke) username"
exit
fi
else
echo "Invalid parameters passed: Please use the script as per below example"
echo "sh ssh_access_control.sh (grant|revoke) username"
fi

if [ `grep -c "^${search_str}" /etc/ssh/sshd_config` -eq 0 ];
then
echo "${search_str} ${user}"  >>   /etc/ssh/sshd_config
else
sed -i "s/^${search_str} .*/${search_str} ${user}/g" /etc/ssh/sshd_config
fi

systemctl restart sshd