eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa_travis
chmod g-w ~/
chmod o-wx ~/
chmod g-w ~/.ssh/
chmod o-wx ~/.ssh/
chmod g-w ~/.ssh/config
chmod o-wx ~/.ssh/config

dirs=(/home/travis/build/fy-travis-projects/genie/)
name="$(cut -d'/' -f6 <<<"${dirs[0]}")"
echo $name

cd $HOME 
sudo apt-get install p7zip-full -y
7z a -r jars.7z .gradle/caches/modules-2/files-2.1
ls -hl jars.7z

mkdir tmp
cd $HOME/build/fy-travis-projects/$name
pwd
find . -name '*.jar' -exec mv {} $HOME/tmp \;
cd $HOME
7z a -r projects.7z tmp
ls -hl projects.7z
ls -al

# cd $HOME/tmp
# git init
# git add .
# git commit -m "init"
# git remote add origin ssh://git@ba941e2da5c12a86.natapp.cc:3154/home/git/src/git/project.git
# git push origin master	


# sudo apt-get update -y
# sudo apt-get install -y pigz
# tar -cf project.tar.gz -I pigz tmp
# ls -hl project.tar.gz

# scp -v -o stricthostkeychecking=no jars.7z fdse@47.103.203.230:/home/fdse/zfy/
# rsync -zav -e "ssh -p 40501 -o StrictHostKeyChecking=no" --info=progress2 jars.7z $HOME/tmp/
rsync -W -e "ssh -o StrictHostKeyChecking=no -o Compression=no" --info=progress2 jars.7z fdse@47.103.203.230:/home/fdse/zfy/
# rsync -W -e "ssh -p 3154 -o StrictHostKeyChecking=no -o Compression=no" --info=progress2 projects.7z fdse@47.103.203.230:/home/fdse/zfy/
# rsync -rv -W -e "ssh -p 3154 -o StrictHostKeyChecking=no" --include='*/' --include='*.jar' --exclude='*' $HOME/build/fy-travis-projects/$name qwe@ba941e2da5c12a86.natapp.cc:/home/qwe/disk1/test/project/
# rsync -rav -W -e "ssh -p 3154 -o StrictHostKeyChecking=no" -f"- */" -f"+ *.jar" $HOME/build/fy-travis-projects/$name qwe@ba941e2da5c12a86.natapp.cc:/home/qwe/disk1/test/project/



