# ROS
OS demo

## 操作环境
使用qemu进行模拟，宿主机ubunut 20.04,使用vmware运行。

安装qemu
```
sudo apt install qemu-system-x86
```

## 运行
```
make
```

# 制作系统
## 生产虚拟硬盘
```
dd bs=512 if=/dev/zero of=hd.img count=204800
```

## 格式化虚拟硬盘
```
sudo losetup /dev/loop0 hd.img
```
可能会报错：losetup: hd.img: failed to set up loop device: Device or resource busy
可用用另外的loop设备

```
✗ sudo losetup -f
/dev/loop14

✗ sudo losetup /dev/loop14 hd.img
```

- 设置回环设备
```
sudo mkfs.ext4 -q /dev/loop14
```

- 建立boot目录
```
mkdir hdisk
sudo mount -o loop ./hd.img ./hdisk/ ;挂载硬盘文件
sudo mkdir ./hdisk/boot/ ;建立boot目录
```

## 安装 GRUB
```
# sudo grub-install --boot-directory=./hdisk/boot/ --force --allow-floppy /dev/loop14
；--boot-directory 指向先前我们在虚拟硬盘中建立的boot目录。
；--force --allow-floppy ：指向我们的虚拟硬盘设备文件/dev/loop14
```

- 创建grub.cfg

```
sudo touch ./hdisk/boot/grub/grub.cfg
```

## 转换虚拟硬盘格式
由于使用的WMware,先把现在产生的hd.img拷贝到win上，然后用StarWind V2V Converter转换为VMware可用的格式。

## 用VMware运行
先用VMware创建无盘的Ubuntu，然后在虚拟机设置中把硬盘改为刚才转换后的文件，就可以启动系统了。

