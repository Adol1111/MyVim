MyVim
=====

我的Vim配置, 按以下步骤配置Vim

1. 先安装git，执行以下语句获取配置，并手动安装 ***Vundle*** 插件
  <pre>
    <code>
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/Adol1111/MyVim.git ~/DotVim/
    </code>
  </pre>
2. 拷贝配置文件到指定目录
  <pre>
    <code>
cd ~/DotVim 
cp .vimrc .ycm_extra_conf.py ~
cp -r colors/ ~/.vim/
cp -r UltiSnips ~/.vim/
    </code>
  </pre>
3. 打开vim, 执行BundleInstall, 安装所有插件
4. 部分插件需要手动编译安装，具体如下：
  1. YouCompleteMe需要手动编译（需要安装Clang支持）
<pre>
    <code>
        cd ~/.vim/bundle/YouCompleteMe
        ./install.sh --clang-completer
    </code>
</pre>
  2. vimshell，需要vimproc支持，需要编译vimproc
  <pre>
    <code>
  cd ~/.vim/bundle/vimproc.vim
  make
    </code>
</pre>
5. 安装中文帮助文档（可选），下载地址：http://vimdoc.sourceforge.net/
