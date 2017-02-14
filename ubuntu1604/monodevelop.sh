#!/bin/bash -e

# 1. use if you can install remote normally
# flatpak install --user --from https://download.mono-project.com/repo/monodevelop.flatpakref

# 2. use if you get certificate error
flatpak list |grep com.xamarin.MonoDevelop 1>/dev/null 2>/dev/null

if [ $? != 0 ];then
  wget --no-check-certificate -O /tmp/monodevelop.flatpakref https://download.mono-project.com/repo/monodevelop.flatpakref
  flatpak install --user /tmp/monodevelop.flatpakref
  rm -y /tmp/monodevelop.flatpakref
fi

sudo cat << EOT | sudo tee /usr/local/bin/monodevelop-flatpack.sh
#!/bin/bash

flatpak run com.xamarin.MonoDevelop

EOT

sudo chmod +x /usr/local/bin/monodevelop-flatpack.sh
