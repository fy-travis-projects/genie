eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa_travis
chmod g-w ~/
chmod o-wx ~/
chmod g-w ~/.ssh/
chmod o-wx ~/.ssh/
chmod g-w ~/.ssh/config
chmod o-wx ~/.ssh/config

# sudo apt-get update -y
# sudo apt-get install -y pigz
# cd $HOME
# pwd
# tar -cf jars.tar.gz -I pigz .gradle/caches/modules-2/files-2.1
# ls -al

# cd $HOME 
# sudo apt-get install p7zip-full -y
# 7z a -r jars.7z .gradle/caches/modules-2/files-2.1
# ls -hl jars.7z
# mkdir tmp
# ls -al

mkdir tmp
cd tmp
pwd
find . -name '*.jar' -exec mv {} tmp/ \
ls -al

dirs=(/home/travis/build/fy-travis-projects/genie/)
name="$(cut -d'/' -f6 <<<"${dirs[0]}")"
echo $name

# scp -P 40501 -o stricthostkeychecking=no jars.7z qwe@198e3e504d5ee164.natapp.cc:/home/qwe/disk1/test/$name/
# rsync -zav -e "ssh -p 40501 -o StrictHostKeyChecking=no" --info=progress2 jars.7z $HOME/tmp/
# rsync -av -W -e "ssh -p 3154 -o StrictHostKeyChecking=no" --info=progress2 --inplace jars.7z qwe@ba941e2da5c12a86.natapp.cc:/home/qwe/disk1/test/jars.7z
# rsync -rv -W -e "ssh -p 3154 -o StrictHostKeyChecking=no" --include='*/' --include='*.jar' --exclude='*' $HOME/build/fy-travis-projects/$name qwe@ba941e2da5c12a86.natapp.cc:/home/qwe/disk1/test/project/
# rsync -rav -W -e "ssh -p 3154 -o StrictHostKeyChecking=no" -f"- */" -f"+ *.jar" $HOME/build/fy-travis-projects/$name qwe@ba941e2da5c12a86.natapp.cc:/home/qwe/disk1/test/project/



