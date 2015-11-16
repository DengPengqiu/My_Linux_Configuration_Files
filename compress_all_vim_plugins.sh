#!/bin/zsh
# 
software_dir="${HOME}/software"
if [ ! -d ${software_dir} ]; then
  mkdir ${software_dir}
fi
date_time=$(date +"%Y%m%d")
compress_file_name=${software_dir}/vim_plugins${date_time}.tar.bz2

# first delete old plugins
if [ ! -f ${compress_file_name} ]; then
  rm -fv ${software_dir}/vim_plugins*.tar.*
  target_dir="${HOME}/.vim"
  echo "tar -jcf $compress_file_name $target_dir"
  time tar -jcf $compress_file_name $target_dir
fi
