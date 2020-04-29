eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa_travis
chmod g-w ~/
chmod o-wx ~/
chmod g-w ~/.ssh/
chmod o-wx ~/.ssh/
chmod g-w ~/.ssh/config
chmod o-wx ~/.ssh/config

sudo apt-get update -y
sudo apt-get install -y pigz
pwd
tar -cf repo.tar.gz -I pigz .gradle
ls -al


dirs=(/home/travis/build/fy-travis-projects/genie/)
name="$(cut -d'/' -f6 <<<"${dirs[0]}")"
echo $dirs
echo $name

rsync -av -e "ssh -p 40501 -o StrictHostKeyChecking=no" ~/repo.tar.gz qwe@198e3e504d5ee164.natapp.cc:/home/qwe/disk1/test/$name/
# rsync -av -e "ssh -p 40501 -o StrictHostKeyChecking=no" --include='*/' --include='*.jar' --exclude='*' ~/build/penelope24/$name/target/ qwe@198e3e504d5ee164.natapp.cc:/home/qwe/disk1/test/$name/