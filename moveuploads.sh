[root@node2 ~]# cat bin/moveuploads.sh
#!/bin/bash
# -------------------------------------------------------
#  find last created directory: format NNNN
# -------------------------------------------------------

cd /mn2/zftp
bash shmo.sh
#newest_dir='ls -d |tail -n1'


The moveuploads then calls shmo.sh which does this ...

[root@node2 ~]# cat /mn2/zftp/shmo.sh
#!/bin/bash
# -------------------------------------------------------
#  find last created directory: format NNNN
# -------------------------------------------------------
lastdir=$(ls -d [0-9][0-9][0-9][0-9] | tail -1)

# -------------------------------------------------------
#  create new sequential directory
# -------------------------------------------------------
#
newdir=`expr $lastdir + 0001`
mkdir $(printf "%04u" $newdir)
echo $(printf "%04u" $newdir)
zimma=$(printf "%04u" $newdir)
echo $zimma
#ls -al /var/ftp/pub |awk '{print $9}'|while read i in;do mv /var/ftp/pub/$i $newdir;done
ls -l /var/ftp/pub |grep jpg|awk '{print $9}'|while read i in;do chmod a+r /var/ftp/pub/$i ;done
ls -l /var/ftp/pub |grep jpg|awk '{print $9}'|while read i in;do mv /var/ftp/pub/$i /mn2/zftp/$zimma ;done

